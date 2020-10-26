import request from '@/utils/request'

// 查询数据采集通道列表
export function listDevice(query) {
  return request({
    url: '/system/device/list',
    method: 'get',
    params: query
  })
}

// 查询数据采集通道详细
export function getDevice(id) {
  return request({
    url: '/system/device/' + id,
    method: 'get'
  })
}

// 新增数据采集通道
export function addDevice(data) {
  return request({
    url: '/system/device',
    method: 'post',
    data: data
  })
}

// 修改数据采集通道
export function updateDevice(data) {
  return request({
    url: '/system/device',
    method: 'put',
    data: data
  })
}

// 删除数据采集通道
export function delDevice(id) {
  return request({
    url: '/system/device/' + id,
    method: 'delete'
  })
}

// 导出数据采集通道
export function exportDevice(query) {
  return request({
    url: '/system/device/export',
    method: 'get',
    params: query
  })
}

// 下发数据
export function issue(data) {
  return request({
    url: '/system/device/issue',
    method: 'post',
    data: data
  })
}

// 查询车辆信息列表
export function listAsset(query) {
  return request({
    url: '/system/asset/list',
    method: 'get',
    params: query
  })
}
