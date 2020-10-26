package com.ruoyi.framework.hadoop;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.io.IOUtils;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;

import static com.ruoyi.framework.config.HadoopConfig.getFileSystem;


@Service
public class HadoopUtils {

    /**
    * 创建文件夹
    * */
    public boolean mkdir(String targetPath) throws Exception {
        //文件对象
        FileSystem fs = getFileSystem();
        //目标路径
        Path path = new Path(targetPath);
        //创建文件夹
        boolean isOk = fs.mkdirs(path);
        fs.close();
        return isOk;
    }

    /**
    *以IO流的形式上传文件
    * */
    public void createFile(String targetPath, MultipartFile file) throws Exception {
        String fileName = file.getOriginalFilename();
        FileSystem fs = getFileSystem();
        //上传时默认当前目录，后面拼接文件目录
        Path path = new Path(targetPath+"/"+fileName);
        //以流的形式输出到hadoop中
        FSDataOutputStream outputStream = fs.create(path);
        outputStream.write(file.getBytes());
        outputStream.close();
        fs.close();
    }

    /**
    * 调用FileSystem的接口上传文件
    * */
    public void uploadFile(String targetPath,String sourcePath) throws Exception {
        FileSystem fs = getFileSystem();
        //源文件的路径
        Path source = new Path(sourcePath);
        //目标文件路径
        Path target = new Path(targetPath);
        // 调用文件系统的文件复制方法，第一个参数是否删除原文件true为删除，默认为false
        fs.copyFromLocalFile(false,source,target);
        fs.close();
    }

    /**
     * 判断HDFS文件是否存在
     * @param path
     * @return
     * @throws Exception
     */
    public static boolean existFile(String path) throws Exception {
        if (StringUtils.isEmpty(path)) {
            return false;
        }
        FileSystem fs = getFileSystem();
        Path srcPath = new Path(path);
        boolean isExists = fs.exists(srcPath);
        return isExists;
    }
    /**
     * 遍历指定目录(direPath)下的所有文件
     *
     */
    public List<Map<String, String>> getDirectoryFromHdfs(String direPath) throws Exception {
        FileSystem fs = getFileSystem();
        FileStatus[] filelist = fs.listStatus(new Path(direPath));
        List<Map<String,String>> result = new LinkedList<>();
        for (int i = 0; i < filelist.length; i++) {
            Map<String,String> res = new HashMap<>();
            FileStatus fileStatus = filelist[i];
            res.put("fileName",fileStatus.getPath().getName());
            result.add(res);
        }
        fs.close();
        return result;
    }
    /**
    * 获取文件夹下的文件列表
    * */
    public List<Map<String,String>> listFile(String targetPath) throws Exception {
        FileSystem fs = getFileSystem();
        Path path = new Path(targetPath);
        RemoteIterator<LocatedFileStatus> filesList = fs.listFiles(path, true);
        List<Map<String, String>> returnList = new ArrayList<>();
        while (filesList.hasNext()) {
            LocatedFileStatus next = filesList.next();
            String fileName = next.getPath().getName();
            Path filePath = next.getPath();
            Map<String, String> map = new HashMap<>();
            map.put("fileName", fileName);
            map.put("filePath", filePath.toString());
            returnList.add(map);
        }
        fs.close();
        return returnList;
    }
    /**
     * 读取HDFS文件内容
     * @param path
     * @return
     * @throws Exception
     */
    public StringBuffer readFile(String path) throws Exception {
        if (StringUtils.isEmpty(path)) {
            return null;
        }
        if (!existFile(path)) {
            return null;
        }
        FileSystem fs = getFileSystem();
        // 目标路径
        Path srcPath = new Path(path);
        FSDataInputStream inputStream = null;
        try {
            inputStream = fs.open(srcPath);
            // 防止中文乱码
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            String lineTxt = "";
            StringBuffer sb = new StringBuffer();
            while ((lineTxt = reader.readLine()) != null) {
                sb.append(lineTxt);
            }
            return sb;
        } finally {
            inputStream.close();
            fs.close();
        }
    }


    /**
    *删除文件
    * */
    public boolean delFile(String targetPath) throws Exception {
        FileSystem fs = getFileSystem();
        Path newPath = new Path(targetPath);
        boolean isOk = fs.deleteOnExit(newPath);
        fs.close();
        return isOk;
    }

    /**
    * 文件重命名
    * */
    public boolean renameFile(String oldName,String newName) throws Exception {
        FileSystem fs = getFileSystem();
        Path oldPath = new Path(oldName);
        Path newPath = new Path(newName);
        boolean isOk = fs.rename(oldPath, newPath);
        fs.close();
        return isOk;
    }

    /**
    * 复制文件（同一个操作系统下）
    * */
    public void copyFile(String sourcePath,String targetPath) throws Exception {
        FileSystem fs = getFileSystem();
        // 原始文件路径
        Path oldPath = new Path(sourcePath);
        // 目标路径
        Path newPath = new Path(targetPath);

        FSDataInputStream inputStream = null;
        FSDataOutputStream outputStream = null;
        try {
            inputStream = fs.open(oldPath);
            outputStream = fs.create(newPath);
            IOUtils.copyBytes(inputStream, outputStream, 1024*1024*64,false);
        } finally {
            inputStream.close();
            outputStream.close();
            fs.close();
        }

    }
    /**
     * 下载HDFS文件
     * @param path
     * @param downloadPath
     * @throws Exception
     */
    public static void downloadFile(String path, String downloadPath) throws Exception {
        if (StringUtils.isEmpty(path) || StringUtils.isEmpty(downloadPath)) {
            return;
        }
        FileSystem fs = getFileSystem();
        // 上传路径
        Path clientPath = new Path(path);
        // 目标路径
        Path serverPath = new Path(downloadPath);

        // 调用文件系统的文件复制方法，第一个参数是否删除原文件true为删除，默认为false
        fs.copyToLocalFile(false, clientPath, serverPath);
        fs.close();
    }

    /**
    * 测试下载hdfs的文件（web下）
    *
    * */
    public void copyFileAsStream(String fpath, OutputStream out) throws Exception {
        Path path = new Path(fpath);
        FileSystem fs = getFileSystem();
        FSDataInputStream fsInput = fs.open(path);
        IOUtils.copyBytes(fsInput, out, 4096, false);
        fsInput.close();
        out.flush();
    }

    /**
     * 获取某个文件在HDFS的集群位置
     * @param path
     * @return
     * @throws Exception
     */
    public BlockLocation[] getFileBlockLocations(String path) throws Exception {
        if (StringUtils.isEmpty(path)) {
            return null;
        }
        if (!existFile(path)) {
            return null;
        }
        FileSystem fs = getFileSystem();
        // 目标路径
        Path srcPath = new Path(path);
        FileStatus fileStatus = fs.getFileStatus(srcPath);
        return fs.getFileBlockLocations(fileStatus, 0, fileStatus.getLen());
    }
    /**
     * 判断文件是否是图片
     * @param file
     * @return
     * @throws IOException
     */
    private boolean isImage(File file) throws IOException {
        BufferedImage bi = ImageIO.read(file);
        if(bi == null){
            return false;
        }
        return true;
    }




}
