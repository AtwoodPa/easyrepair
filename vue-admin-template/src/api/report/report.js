import request from '@/utils/request'

const api_name = '/api/v1/report'

export default {

  getPageList(page, limit, searchObj) {
    return request({
      url: `${api_name}/${page}/${limit}`,
      method: 'get',
      params: searchObj // url查询字符串或表单键值对
    })
  },
  getById(id) {
    return request({
      url: `${api_name}/get/${id}`,
      method: 'get'
    })
  },

  save(record) {
    return request({
      url: `${api_name}/save`,
      method: 'post',
      data: record
    })
  },

  updateById(record) {
    return request({
      url: `${api_name}/update`,
      method: 'put',
      data: record
    })
  },
  removeById(id) {
    return request({
      url: `${api_name}/delete/${id}`,
      method: 'delete'
    })
  },
  //更新用户状态
  updateStatus(id, status) {
    return request({
      url: `${api_name}/updateStatus/${id}/${status}`,
      method: 'get'
    })
  },
  /**
   * 批量删除api
   * @param idList
   * @returns {*}
   */
  batchRemove(idList) {
    return request({
      url: `${api_name}/batchRemove`,
      method: `delete`,
      data: idList
    })
  },

}
