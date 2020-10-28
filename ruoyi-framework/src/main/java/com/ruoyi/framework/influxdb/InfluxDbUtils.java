package com.ruoyi.framework.influxdb;

import org.influxdb.InfluxDB;
import org.influxdb.annotation.Column;
import org.influxdb.annotation.Measurement;
import org.influxdb.dto.BatchPoints;
import org.influxdb.dto.Point;
import org.influxdb.dto.Query;
import org.influxdb.dto.QueryResult;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * influxdb操作工具类
 * @date 2020年7月27日
 * @Description
 *
 */
@Component
public class InfluxDbUtils {

    @Resource
    private InfluxDB influxDB;

    @Value("${spring.influx.database}")
    private String database;

    /**
     * 新增单条记录,利用java的反射机制进行新增操作
     */
    public void insertOne(Object obj){
        //获取度量
        Class<?> clasz = obj.getClass();
        Measurement measurement = clasz.getAnnotation(Measurement.class);
        //构建
        Point.Builder builder = Point.measurement(measurement.name());
        // 获取对象属性
        Field[] fieldArray = clasz.getDeclaredFields();
        Column column = null;
        for(Field field : fieldArray){
            try {
                column = field.getAnnotation(Column.class);
                //设置属性可操作
                field.setAccessible(true);
                if(column.tag()){
                    //tag属性只能存储String类型
                    builder.tag(column.name(), field.get(obj).toString());
                }else{
                    //设置field
                    if(field.get(obj) != null){
                        builder.addField(column.name(), field.get(obj).toString());
                    }
                }
            } catch (IllegalArgumentException | IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        influxDB.write(builder.build());
    }

    /**
     * 批量新增,方法一
     */
    public void insertBatchByRecords(List<?> records){
        List<String> lines = new ArrayList<String>();
        records.forEach(record->{
            Class<?> clasz = record.getClass();
            //获取度量
            Measurement measurement = clasz.getAnnotation(Measurement.class);
            //构建
            Point.Builder builder = Point.measurement(measurement.name());
            Field[] fieldArray = clasz.getDeclaredFields();
            Column column = null;
            for(Field field : fieldArray){
                try {
                    column = field.getAnnotation(Column.class);
                    //设置属性可操作
                    field.setAccessible(true);
                    if(column.tag()){
                        //tag属性只能存储String类型
                        builder.tag(column.name(), field.get(record).toString());
                    }else{
                        //设置field
                        if(field.get(record) != null){
                            builder.addField(column.name(), field.get(record).toString());
                        }
                    }
                } catch (IllegalArgumentException | IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
            lines.add(builder.build().lineProtocol());
        });
        influxDB.write(lines);
    }

    /**
     * 批量新增，方法二
     */
    public void insertBatchByPoints(List<?> records){
        BatchPoints batchPoints = BatchPoints.database(database)
                .consistency(InfluxDB.ConsistencyLevel.ALL)
                .build();
        records.forEach(record->{
            Class<?> clasz = record.getClass();
            //获取度量
            Measurement measurement = clasz.getAnnotation(Measurement.class);
            //构建
            Point.Builder builder = Point.measurement(measurement.name());
            Field[] fieldArray = clasz.getDeclaredFields();
            Column column = null;
            for(Field field : fieldArray){
                try {
                    column = field.getAnnotation(Column.class);
                    //设置属性可操作
                    field.setAccessible(true);
                    if(column.tag()){
                        //tag属性只能存储String类型
                        builder.tag(column.name(), field.get(record).toString());
                    }else{
                        //设置field
                        if(field.get(record) != null){
                            builder.addField(column.name(), field.get(record).toString());
                        }
                    }
                } catch (IllegalArgumentException | IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
            batchPoints.point(builder.build());
        });
        influxDB.write(batchPoints);
    }

    /**
     * 查询，返回Map集合
     * @param query 完整的查询语句
     * @return
     */
    public List<Object> fetchRecords(String query){
        List<Object> results = new ArrayList<Object>();
        QueryResult queryResult = influxDB.query(new Query(query, database));
        queryResult.getResults().forEach(result->{
            result.getSeries().forEach(serial->{
                List<String> columns = serial.getColumns();
                int fieldSize = columns.size();
                serial.getValues().forEach(value->{
                    Map<String,Object> obj = new HashMap<String,Object>();
                    for(int i=0;i<fieldSize;i++){
                        obj.put(columns.get(i), value.get(i));
                    }
                    results.add(obj);
                });
            });
        });
        return results;
    }

    /**
     * 查询，返回map集合
     * @param fieldKeys 查询的字段，不可为空；不可为单独的tag
     * @param measurement 度量，不可为空；
     * @param order
     * @param limit
     * @return
     */
    public List<Object> fetchRecords(String fieldKeys, String measurement){
        StringBuilder query = new StringBuilder();
        query.append(" select ").append(fieldKeys).append(" from ").append(measurement);
        return this.fetchRecords(query.toString());
    }

    /**
     * 查询，返回map集合
     * @param fieldKeys 查询的字段，不可为空；不可为单独的tag
     * @param measurement 度量，不可为空；
     * @param order
     * @param limit
     * @return
     */
    public List<Object> fetchRecords(String fieldKeys, String measurement, String order){
        StringBuilder query = new StringBuilder();
        query.append("select ").append(fieldKeys).append(" from ").append(measurement);
        query.append(" order by ").append(order);
        return this.fetchRecords(query.toString());
    }

    /**
     * 查询，返回map集合
     * @param fieldKeys 查询的字段，不可为空；不可为单独的tag
     * @param measurement 度量，不可为空；
     * @param order
     * @param limit
     * @return
     */
    public List<Object> fetchRecords(String fieldKeys, String measurement, String order, String limit){
        StringBuilder query = new StringBuilder();
        query.append("select ").append(fieldKeys).append(" from ").append(measurement);
        query.append(" order by ").append(order);
        query.append(limit);
        return this.fetchRecords(query.toString());
    }

    /**
     * 查询，返回对象的list集合
     * @param query
     * @return
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public <T> List<T> fetchResults(String query, Class<?> clasz){
        List results = new ArrayList<>();
        QueryResult queryResult = influxDB.query(new Query(query, database));
        queryResult.getResults().forEach(result->{
            result.getSeries().forEach(serial->{
                List<String> columns = serial.getColumns();
                int fieldSize = columns.size();
                serial.getValues().forEach(value->{
                    Object obj = null;
                    try {
                        obj = clasz.newInstance();
                        for(int i=0;i<fieldSize;i++){
                            String fieldName = columns.get(i);
                            Field field = clasz.getDeclaredField(fieldName);
                            field.setAccessible(true);
                            Class<?> type = field.getType();
                            if(type == float.class){
                                field.set(obj, Float.valueOf(value.get(i).toString()));
                            }else{
                                field.set(obj, value.get(i));
                            }
                        }
                    } catch (NoSuchFieldException | SecurityException | InstantiationException | IllegalAccessException e) {
                        e.printStackTrace();
                    }
                    results.add(obj);
                });
            });
        });
        return results;
    }

    /**
     * 查询，返回对象的list集合
     * @param fieldKeys
     * @param measurement
     * @param clasz
     * @return
     */
    public <T> List<T> fetchResults(String fieldKeys, String measurement, Class<?> clasz){
        StringBuilder query = new StringBuilder();
        query.append("select ").append(fieldKeys).append(" from ").append(measurement);
        return this.fetchResults(query.toString(), clasz);
    }

    /**
     * 查询，返回对象的list集合
     * @param fieldKeys
     * @param measurement
     * @param order
     * @param clasz
     * @return
     */
    public <T> List<T> fetchResults(String fieldKeys, String measurement, String order, Class<?> clasz){
        StringBuilder query = new StringBuilder();
        query.append("select ").append(fieldKeys).append(" from ").append(measurement);
        query.append(" order by ").append(order);
        return this.fetchResults(query.toString(), clasz);
    }

    /**
     * 查询，返回对象的list集合
     * @param fieldKeys
     * @param measurement
     * @param order
     * @param limit
     * @param clasz
     * @return
     */
    public <T> List<T> fetchResults(String fieldKeys, String measurement, String order, String limit, Class<?> clasz){
        StringBuilder query = new StringBuilder();
        query.append("select ").append(fieldKeys).append(" from ").append(measurement);
        query.append(" order by ").append(order);
        query.append(limit);
        return this.fetchResults(query.toString(), clasz);
    }

    public List<Object> getByKeys(String[] keys, String measurement){
        String param = null;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" select ");
        if(keys != null){
            for(int i=0;i<keys.length;i++){
                if (keys.length<=1){
                    //key::field
                    param="\""+keys[0]+"\"::field";
                    stringBuilder.append(param);
                    break;
                }
                param = "\""+keys[i]+"\"::field,";
                if(i==keys.length-1){
                    param=param.substring(0,param.length()-1);
                }
                stringBuilder.append(param);
            }
        }else {
            stringBuilder.append(" * ");
        }
        stringBuilder.append(" from ").append(measurement);

        stringBuilder.append(" order by time asc");
        System.out.println(stringBuilder.toString());
        List<Object> result = this.fetchRecords(stringBuilder.toString());
        return result;
    }
}
