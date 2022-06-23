package com.company.pickers.scheduler;

import com.company.pickers.controller.CrawlingController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


/**
 * 시스템 환경 알림 서비스
 */
@Component
@Slf4j
public class Scheduler {

    @Autowired
    CrawlingController crawlingController;

    /**
     * 1분마다 product 테이블 갱신
     */
    @Scheduled(cron = "0 */1 * * * *")
    public void getProduct() {
        crawlingController.placeStore();
    }
}
