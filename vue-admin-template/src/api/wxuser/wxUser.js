import request from '@/utils/request'

const api_name = '/user'

export default {

  getAllWxUser(){
    return request({
      url: `${api_name}/allWxUserInfo`,
      method: 'get'
    })
  },
  //更新用户状态
  updateStatus(id, status) {
    return request({
      url: `${api_name}/updateStatus/${id}/${status}`,
      method: 'get'
    })
  }
}
