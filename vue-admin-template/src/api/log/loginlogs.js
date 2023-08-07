import request from '@/utils/request'

const api_name = '/admin/system/sysLoginLog'

export default {

  /**
   * 获取分页数据
   * @param page
   * @param limit
   * @param searchObj
   * @returns {*}
   */
  getPageList(page, limit, searchObj) {
    return request({
      url: `${api_name}/${page}/${limit}`,
      method: 'get',
      params: searchObj // url查询字符串或表单键值对
    })
  },
  /**
   * 根据id获取数据
   * @param id
   * @returns {*}
   */
  getById(id) {
    return request({
      url: `${api_name}/get/${id}`,
      method: 'get'
    })
  },
}
