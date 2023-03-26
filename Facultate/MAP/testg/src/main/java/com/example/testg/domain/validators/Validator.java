package com.example.testg.domain.validators;

public interface Validator<T> {
    void validate(T entity) throws ValidationException;
}