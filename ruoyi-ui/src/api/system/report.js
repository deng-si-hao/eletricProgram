import request from '@/utils/request'

// 查询文档存储列表
export function listReport(query) {
  return request({
    url: '/system/report/list',
    method: 'get',
    params: query
  })
}

// 查询文档存储详细
export function getReport(id) {
  return request({
    url: '/system/report/' + id,
    method: 'get'
  })
}

// 新增文档存储
export function addReport(data) {
  return request({
    url: '/system/report',
    method: 'post',
    data: data
  })
}

// 修改文档存储
export function updateReport(data) {
  return request({
    url: '/system/report',
    method: 'put',
    data: data
  })
}

// 删除文档存储
export function delReport(id) {
  return request({
    url: '/system/report/' + id,
    method: 'delete'
  })
}

// 导出文档存储
export function exportReport(query) {
  return request({
    url: '/system/report/export',
    method: 'get',
    params: query
  })
}

// 下发文档存储
export function issue(data) {
  return request({
    url: '/system/report/issue',
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

// 查询文件列表
export function listDetail(data) {
  return request({
    url: '/system/report/detail',
    method: 'post',
    data: data
  })
}

// 删除文件（只删除hadoop）
export function delDetailFile(data) {
  return request({
    url: '/system/report/delDetailFile',
    method: 'post',
    data:data,
  })
}

// 下载文件
export function downloadFile(data) {
  return request({
    url: '/system/report/downloadFile',
    method: 'post',
    data:data,
  })
}
