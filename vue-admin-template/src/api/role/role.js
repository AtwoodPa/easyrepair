import request from '@/utils/request'

// const api_name = '/admin/system/sysRole'
const api_name = '/admin/system/sysRole'
export default {
  // 列表
  // getPageList(page, limit, searchObj) {
  //   return request({
  //     // TODO 接口路径
  //     // url: '/admin/system/sysRole/' + page + '/' + limit,
  //     url: `${api_name}/${page}/${limit}`,
  //     method: 'get', // 提交方式
  //     params: searchObj // 参数
  //   })
  // }
  /*
  获取角色分页列表(带搜索)
  */
  getPageList(page, limit, searchObj) {
    return request({
      url: `${api_name}/${page}/${limit}`,
      method: 'get',
      params: searchObj
    })
  },
  /**
   * 根据id进行删除
   * @param id
   * @returns {*}
   */
  removeById(id) {
    return request({
      url: `${api_name}/remove/${id}`,
      method: 'delete'
    })
  },
  /**
   * 角色添加api
   * @param role
   * @returns {*}
   */
  saveRole(role) {
    return request({
      // 接口路径
      url: `${api_name}/save`,
      method: 'post', // 提交方式
      // 由于后端接口接收的对象是json格式，所以这里的params修改为data接收参数
      data: role
    })
  },
  /**
   * 根据id进行编辑
   * @param id
   * @returns {*}
   */
  //编辑
  getById(id) {
    return request({
      url: `${api_name}/findRoleById/${id}`,
      method: 'get'
    })
  },
  /**
   * 更新api
   * @param role
   * @returns {*}
   */
  //更新
  updateById(role) {
    return request({
      url: `${api_name}/update`,
      method: 'put',
      data: role
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
  //根据用户id查询用户已分配的角色
  getRolesByUserId(userId) {
    return request({
      url: `${api_name}/toAssign/${userId}`,
      method: 'get'
    })
  },

//分配角色
  assignRoles(assginRoleVo) {
    return request({
      url: `${api_name}/doAssign`,
      method: 'post',
      data: assginRoleVo
    })
  }
  // removeById(id){
  //   return request({
  //     url: `${api_name}/remove/${id}`,
  //     method: 'DELETE'
  //   })
  // },
}
// export function getList(params) {
//   return request({
//     url: '/vue-admin-template/table/list',
//     method: 'get',
//     params
//   })
// }
