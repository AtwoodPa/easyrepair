package org.ee.authority.service.bussiness.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.ee.authority.entity.bussiness.Report;
import org.ee.authority.mapper.bussiness.ReportMapper;
import org.ee.authority.service.bussiness.ReportService;
import org.ee.authority.vo.ReportQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author CoderPan
 * @since 2023-05-10
 */
@Service("reportService")
public class ReportServiceImpl extends ServiceImpl<ReportMapper, Report> implements ReportService {
    @Autowired
    private ReportMapper reportMapper;

    /**
     * 根据状态更新用户的所有报修记录
     * @param id
     * @param status
     * @return
     */
    @Override
    public boolean updateStatus(Long id, Integer status) {
        // 先根据id进行查询
        Report report = reportMapper.selectById(id);
        report.setStatus(status);

        int updateById = reportMapper.updateById(report);
        if (updateById > 0) {
            return true;
        }else {
            return false;
        }
    }

    /**
     * 查询分页数据pageList
     * @param pageParam
     * @param reportQueryVo
     * @return
     */
    @Override
    public IPage<Report> selectPage(Page<Report> pageParam, ReportQueryVo reportQueryVo) {
        return reportMapper.selectPage(pageParam,reportQueryVo);
    }

    @Override
    public Page<Report> selectPage2(Page<Report> pageReport, Integer type, String nickName) {

        return reportMapper.selectPage2(pageReport,type,nickName);
    }


}
