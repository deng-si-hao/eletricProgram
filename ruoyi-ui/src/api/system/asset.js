import request from '@/utils/request'

// 查询车辆信息列表
export function listAsset(query) {
  return request({
    url: '/system/asset/list',
    method: 'get',
    params: query
  })
}

// 查询车辆信息详细
export function getAsset(id) {
  return request({
    url: '/system/asset/' + id,
    method: 'get'
  })
}

// 新增车辆信息
export function addAsset(data) {
  return request({
    url: '/system/asset',
    method: 'post',
    data: data
  })
}

// 修改车辆信息
export function updateAsset(data) {
  return request({
    url: '/system/asset',
    method: 'put',
    data: data
  })
}

// 删除车辆信息
export function delAsset(id) {
  return request({
    url: '/system/asset/' + id,
    method: 'delete'
  })
}

// 导出车辆信息
export function exportAsset(query) {
  return request({
    url: '/system/asset/export',
    method: 'get',
    params: query
  })
}

//下发车辆信息
export function issue(data) {
  return request({
    url: '/system/asset/issue',
    method: 'post',
    data: data
  })
}

// 下载用户导入模板
export function importTemplate() {
  return request({
    url: '/system/asset/importTemplate',
    method: 'get'
  })
}
