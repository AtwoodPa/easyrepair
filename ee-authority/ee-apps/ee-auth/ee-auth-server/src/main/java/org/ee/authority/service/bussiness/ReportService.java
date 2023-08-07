package org.ee.authority.service.bussiness;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.ee.authority.entity.bussiness.Report;
import org.ee.authority.vo.ReportQueryVo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author CoderPan
 * @since 2023-05-10
 */
public interface ReportService extends IService<Report> {

    /**
     * 更新设备状态
     * @param id
     * @param status
     * @return
     */
    boolean updateStatus(Long id, Integer status);

    IPage<Report> selectPage(Page<Report> pageParam, ReportQueryVo reportQueryVo);


    Page<Report> selectPage2(Page<Report> pageReport, Integer type, String nickName);
}