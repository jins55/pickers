package com.company.pickers.vm;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.io.Serializable;

/***
 * KangChun,Seo
 * Api 응답 객체
 * @param <T>
 */
@Getter
public class ResultVM<T> implements Serializable {

    private static final long serialVersionUID = 7763833945354654830L;

    @JsonProperty("status")
    private HttpStatus status;

    @JsonProperty("data")
    public transient T data;

    public ResultVM() {
        this.status = HttpStatus.OK;
    }

    public ResultVM(T data) {
        this.status = HttpStatus.OK;
        this.data = data;
    }

    public ResponseEntity<ResultVM<T>> wrap(HttpStatus status) {
        this.status = status;
        return new ResponseEntity<>(this, status);
    }

    public Integer getStatus() {
        return status.value();
    }
}
