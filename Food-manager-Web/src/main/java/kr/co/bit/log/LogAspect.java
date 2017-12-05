package kr.co.bit.log;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAspect {
   
   String pattern = "yyyy-MM-dd hh:mm:ss";
   SimpleDateFormat sdf = new SimpleDateFormat(pattern);
   
   @Around("execution(* kr.co.bit..*.*(..))")
   public Object trace(ProceedingJoinPoint joinPoint) throws Throwable{
   
      System.out.println(sdf.format(new Date()) + " || "+ joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + " 시작");
      try {
         
         Object obj = joinPoint.proceed();
         return obj;
         
      } finally {
         System.out.println(sdf.format(new Date()) + " || "+ joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + " 종료");
      }
   }
}