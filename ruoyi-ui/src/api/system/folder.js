import request from '@/utils/request'

// 查询文件储存路径列表
export function listFolder(query) {
  return request({
    url: '/system/folder/list',
    method: 'get',
    params: query
  })
}

// 查询文件储存路径详细
export function getFolder(id) {
  return request({
    url: '/system/folder/' + id,
    method: 'get'
  })
}

// 新增文件储存路径
export function addFolder(data) {
  return request({
    url: '/system/folder',
    method: 'post',
    data: data
  })
}

// 修改文件储存路径
export function updateFolder(data) {
  return request({
    url: '/system/folder',
    method: 'put',
    data: data
  })
}

// 删除文件储存路径
export function delFolder(id) {
  return request({
    url: '/system/folder/' + id,
    method: 'delete'
  })
}

// 导出文件储存路径
export function exportFolder(query) {
  return request({
    url: '/system/folder/export',
    method: 'get',
    params: query
  })
}