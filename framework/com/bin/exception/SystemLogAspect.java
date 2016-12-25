package com.bin.exception;

import java.lang.reflect.Method;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bin.annotation.MyException;
import com.bin.context.BackupUserContext;
import com.bin.model.ExceptionLog;
import com.bin.service.ExceptionLogService;

@Aspect
@Component
public class SystemLogAspect {

	@Autowired
	private ExceptionLogService exceptionLogService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SystemLogAspect.class);
	
	@Pointcut("@annotation(com.bin.annotation.MyException)")
	public void exceptionAspect(){
		
	}
	
	

	@AfterThrowing(pointcut = "exceptionAspect()",throwing = "e")
	public void doAfterThrowing(JoinPoint joinPoint , Throwable e){
		String params = "";
		if(joinPoint.getArgs() != null && joinPoint.getArgs().length > 0){
			for(int i = 0 ; i < joinPoint.getArgs().length ; i++){
				params += joinPoint.getArgs()[i] + ";";
			}
		}
		try{
			ExceptionLog log = new ExceptionLog();
			log.setDescription(getExceptionMethodDesc(joinPoint));
			log.setDetail(e.getMessage().toString().length() > 1000 ? e.getMessage().toString().substring(0, 1000) : e.getMessage().toString());
			log.setName(e.getClass().getName());
			log.setMethod(joinPoint.getTarget().getClass().getName() + "-" + joinPoint.getSignature().getName() + "()");
			log.setUsername(BackupUserContext.getContext().getUser().getUsername());
			log.setCreateTime(new Date());
			log.setParams(params.toString().length() > 1000 ? params.toString().substring(0, 1000) : params);
			exceptionLogService.save(log);
		}catch(Exception e1){
			e.printStackTrace();
			LOGGER.error(e1.getMessage());
		}
		
		e.printStackTrace();
	}

	@SuppressWarnings("rawtypes")
	private String getExceptionMethodDesc(JoinPoint joinPoint) throws ClassNotFoundException {
		String targetName = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object [] arguments = joinPoint.getArgs();
		Class targetClass = Class.forName(targetName);
		Method [] methods = targetClass.getMethods();
		String desc = "";
		for(Method method : methods){
			if(method.getName().equals(methodName)){
				Class [] clazzs = method.getParameterTypes();
				if(clazzs.length == arguments.length){
					desc = method.getAnnotation(MyException.class).desc();
				}
			}
		}
		return desc;
	}

	
}
