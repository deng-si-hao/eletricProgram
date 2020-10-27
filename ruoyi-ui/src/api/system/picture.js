import request from '@/utils/request'

// 查询图片存储列表
export function listPicture(query) {
  return request({
    url: '/system/picture/list',
    method: 'get',
    params: query
  })
}

// 查询图片存储详细
export function getPicture(id) {
  return request({
    url: '/system/picture/' + id,
    method: 'get'
  })
}

// 新增图片存储
export function addPicture(data) {
  return request({
    url: '/system/picture',
    method: 'post',
    data: data
  })
}

// 修改图片存储
export function updatePicture(data) {
  return request({
    url: '/system/picture',
    method: 'put',
    data: data
  })
}

// 删除图片存储
export function delPicture(id) {
  return request({
    url: '/system/picture/' + id,
    method: 'delete'
  })
}

// 导出图片存储
export function exportPicture(query) {
  return request({
    url: '/system/picture/export',
    method: 'get',
    params: query
  })
}
// 导出图片存储
export function issue(data) {
  return request({
    url: '/system/picture/issue',
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
