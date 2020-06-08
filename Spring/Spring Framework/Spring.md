# Spring

## Spring 概述

1. 开源框架
	* 框架：抽取成一种高度可重用的；事务控制，强大的servlet，项目的一些工具；多个可重用模块的整合，形成一个某个邻域的整体方案。
2. EJB--→Spring 简化了xml配置和复杂的代码。
3. Spring是一个IOC(DI)和AOP容器框架。
4. Spring的优良特性
	1. 非侵入式：基于Spring开发的应用中的对象可以不依赖于Spring的API
	2. 依赖注入：DI——Dependency Injection，反转控制(IOC)最经典的实现。
	3. 面向切面编程：Aspect Oriented Programming——AOP
	4. 容器：Spring是一个容器，因为它包含并且管理应用对象的生命周期
	5. 组件化：Spring实现了使用简单的组件配置组合成一个复杂的应用。在 Spring 中可以使用XML和Java注解组合这些对象。
	6. 一站式：在IOC和AOP的基础上可以整合各种企业应用的开源框架和优秀的第三方类库（实际上Spring 自身也提供了表述层的SpringMVC和持久层的Spring JDBC）。
5.减少耦合，编译时不依赖，运行时依赖
```java
DriverMnager.registerDriver(new com.mysql.jac.jdbc.Driver());
-→ Class.forName("com.mysql.jac.jdbc.Driver");
```
  ![](images\spring-overview.png)

## IOC

1. IOC(Inversion Of Control):控制反转，吧创建对象的权利交给框架，是框架的重要特征，**削减序中的耦合**
	1. 控制：资源获取方式
		1. 主动式 new
		2. 被动式 资环获取交给容器来创建和设置
	2. 容器：管理所有的组件（类）容器可以自动探查出那些组件需要使用，帮我们创建组件。
2. 根据id获取对象
	1. ClassPathXmlApplicationContext：可以加载雷路今夏的**XML配置文件**，要求配置文件必须在类路径下。
	2. FileSystemXmlApplicationContext：可以加载磁盘任意路径下的**XML配置文件**
	3. AnnotationConfigApplicationContext：用于**读取注解**创建的容器
3. 核心容器接口
	1. ApplicationContext:他在构建核心容器时，创建对象采取的策略是采用立即加载的方式。只要一读取完配置文件马上就创建配置文件中的对象。
	2. BeanFactory:它在构建核心容器时，创建对象采用的策略是采用延迟加载的方法。当获取对象时才真正创建对象。
4. Spring管理对象的细节
	1. 创建对象的三种方式
		1. 使用默认构造函数创建
			* 使用bean标签，设置id和class没有其他标签和属性时，必须要无参构造函数
		2. 使用某个工厂中的方法创建并返回对象
			* 不需要class factory-bean:工厂 factory-method:创建方法
		3. 使用静态工厂中的方法创建并返回对象
			* class:对应静态类 factory-method:创建方法
	2. 对象作用范围
		1. scope标签
			1. singleton 单例（默认）
			2. prototype 多例
			3. request 作用于web应用的会话范围
			4. session 作用于web应用的会话范围
			5. global-session 作用于集群环境的会话范围（全局会话范围），当不是集群环境就是session
			* 多服务器中使用时
	3. 对象生命周期
		1. 单例
			1. 出生 当容器创建时
			2. 活着	只用容器存在，对象就一直活着
			3. 死亡 容器对象的生命周期和容器相同
		2. 多例
			1. 出生	当我们使用对象时，Spring创建
			2. 活着	使用时就会一直活着
			3. 死亡 当对象长时间未用，且没有别的对象引用时，java的垃圾回收器会回收对象
5. DI(Dependency Injection)依赖注入：容易能知道哪个组件运行的时候，需要另外一个组件。管理组件之间的依赖关系 | xmlns:xsi
	1. 注入类型
		1. 基本类型和String
		2. 其他bean类型（在配置文件中的bean）
		3. 复杂类型/集合类型
	2. 注入方法
		1. 使用构造函数提供
		2. 使用set方法提供
		3. 使用注解方式提供 
	3. constructor-arg *bean标签内部
		* 优势 在获取bean对象时，注入数据是必须的操作，否则无法创建
		* 弊端 改变了对bean对象的实例化方式，使我们在创建对象时，必须提供数据
		1. type 用于指定要注入的数据类型，该数据类型也是构造函数中某个或某些参数的类型
		2. index 用于指定要注入的数据给构造函数中指定索引位置的参数赋值，索引从0开始
		3. **name 用于指定给构造函数中指定名称的参数赋值**
		4. value 提供基本类型和String类型
		5. ref 引用其他的的bean类型数据
	4. property *bean标签内部 使用set方法注入
		* 优势 创建对象时没有明确限制，可以直接使用默认构造函数
		* 弊端 如果某个成员必须有值，则获取对象是有可能set方法没有执行
		1. **name 用于指定给构造函数中指定名称的参数赋值**
		2. value 提供基本类型和String类型
		3. ref 引用其他的的bean类型数据
	5. 复杂类型的注入 property
		1. List注入数据标签：list|set|array
		2. Map注入数据标签：map|props
6. **注解IOC** | xmlns:context
	* 需要导入Spring注解jar包 <context:component-scan base-packge="">
	1. 用于创建对象的
		1. @Component(value="") 用于把当前类对象存入Spring容器中
			* 没有value时，默认为开头字母小写的类名
		2. @Controller 表现层|@Service 业务层|@Repository 持久层
	2. 用于注入数据
		1. @Autowired 自动按照类型注入。只要容器中有唯一的一个bean对象类型和要注入的变量类型匹配，就可以注入成功
			* 位置方法或变量上方 set方法不是必须的
			* 自动注入顺序 类型--→变量名称
		2. @Qualifier 在按照@Autowired注入的基础上再按照名称注入。它在给类成员注入时不能单独使用，注入方法可以。
			* value 用于指定注入bean的id
		3. @Resource(name="") 直接按照bean的id注入，可单独使用。
		4. @Value() 用于注入基本类型和String类型数据
			* 可以使用Spring中的SpEL ${表达式}
	3. 用于改变作用范围的
		1. @Scope("") singleton 单例|prototype 多例    * 默认单例 
	4. 和生命周期相关
		1. PostConstruct 指定初始化方法
		2. PreDestroy 指定销毁方法
7. 完全注解IOC
	1. 配置一个SpringConfiguration类
	2. @Configuration
	3. @ComponentScan(basePackages={"",""}) 指定需要扫描的包，类似context:component-scan
	4. @Bean(name="")+方法 用于把当前方法的返回值作为bean对象存入Spring的ioc容器中
		* name用于指定id，默认为方法名称
		* 当我们使用注解配置方法时，如果有参数，Spring框架会自动去ioc容器中寻找有没有可用的bean对象。匹配注入顺序 类型--→变量名称
	5. @Scope("") singleton 单例|prototy 多例
	6. @Import(字节码) 导入子配置类
	7. @PropertySource 指定properties文件位置
8. spring-test
	1. @Runwith 测试注释
	2. @ContextConfiguration location xml文件|classes 注解类
## AOP

1. AOP(ASpect Oriented Programming)面向切面编程 抽取重复代码，

2. 作用：使用动态管理技术，在不改变源码的基础上对已有的方法进行增强。

3. 优势：减少重复代码；提高开发效率；便于维护。

4. 动态代理机制 JDK
	1. 特点：字节码随用随加载，随用随加载
	2. 基于接口的动态代理 Proxy.newProxyInstance()
		1. 创建方法newProxyInstance 被代理对象至少实现一个接口，如果没有则不能使用
			1. ClassLoder 类加载器
				
				* 用于加载代理对象字节码的。和被代理对象使用相同的类加载器。固定写法。
			2. Class[] 字节码数组
				
				* 它是用于让代理对象和被代理对象有相同方法。固定写法
			3. InvocationHandler 提供增强代码
				* 它是让我们写如何代理。通常是匿名类，谁用谁写。
				1. proxy 代理对象的引用
				2. method 当前执行的方法
				3. args[] 当前执行方法的所有参数
				4. return method.invoke(类，参数)
	3. 基于子类的动态代理 
		1. 创建方法Enhancer中的create方法
			
			* 被代理对象不能是最终类
		2. Class 字节码
		3. Callback 提供增强代码
			1. proxy
			
			2. method
			
			3. args[]
			
			  **同上**
		4. methodProxy 当前执行对象的代理方法
	
5. AOP操作术语
	1. Joinpoint(连接点) 类里面可以被增强的方法，这些方法称为连接点（可以被增强的方法）
	2. Pointcut(切入点):所谓切入点是指我们要对哪些Joinpoint进行拦截的定义.
	3. Advice(通知/增强) 所谓通知是指拦截到Joinpoint之后所要做的事情就是通知.通知分为前置通知,后置通知,异常通知,最终通知,环绕通知(切面要完成的功能)
		* 方法执行method.invoke 
		1. 前置通知 在切入点方法**执行**之前执行
		2. 后置通知 在切入点方法**注册执行**之后执行
		3. 异常通知 在切入点方法**出现异常**执行
		4. 最终通知 在切入点方法后置之后**最终会执行**
		5. 环绕通知 new InvocationHandler()
	4. Aspect(切面) 是切入点和通知（引介）的结合
	5. Introduction(引介) 引介是一种特殊的通知在不修改类代码的前提下, Introduction可以在运行期为类动态地添加一些方法或Field.
	6. Target(目标对象) 代理的目标对象(要增强的类)
	7. Weaving(织入) 是把增强应用到目标的过程.把advice 应用到 target的过程.
	8. Proxy(代理) 一个类被AOP织入增强后，就产生一个结果代理类
	
6. AOP XML配置 | xmlns:aop
	1. \<aop:config> 配置aop
	2. <aop:aspect id="" ref="">
	3. <aop:xxx method="方法名" pointcut=""> 
		* pointcut 切入点|execution(返回修饰符 返回值 路径.类名.方法名(参数))
		* 全统配写法 * *..*.*(..) 
			* 返回修饰符可省略
			* 返回值可以使用通配符
			* 包名可以使用通配符，分级表示 ..表示当前包及其子包
			* 参数数量，类型都能限制，可用通配符 ..表示任意
		1. befor 前置通知
		2. after-returning 后置通知
		3. after-throwing 异常通知
		4. after 最终通知
		5. around 环绕通知|代码实现通知配置
			* 动态管理有明确切入点，Spring标签里没有
			```java
			public Object method(ProceedingJoinPoint pjp)
					Object rtValue = null;
					try{
						Object[] args = pjp.getArgs();
						前置方法;
						rtValue = pjp.proceed(args);
						后置方法;
						return rtValue;
					}catch (Throeable t){
						异常方法;
					}finally{
						最终方法;
					}
			```
	4. <aop:pointcut id="" expression=""> 位置不同，作用范围不同
	
7. 注解aop | xmlns:context
    * \<aop:aspectj-autoproxy/>
    1. @Aspect 切面类
    2. @Pointcut("方法名()")
    3. @Before("方法名()")
    4. @AfterReturning("方法名()")
    5. @AfterThrowing("方法名()")
    6. @After("方法名()")
    * 顺序有变 前|最终|后/异常
    7. @Around("方法")
8. 完全注解aop

  1. @EnableAspectJAutoProxy

10. 事务控制
      1. 前置通知 开启事务
      2. 后置通知 提交事务
      3. 异常通知 回滚事务
      4. 最终通知 释放连接
## 事务控制

1. XML声明式事务控制 | xmlns:tx

  2. 配置事务管理器

     ```xml
     <!-- 配置事务管理器 -->
     <bean id="transactionManager" 
     	  class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
     	<property name="dataSource" ref="dataSource"/>	  
     </bean>
     
     ```

  3. 配置事务通知

        1. 使用\<tx:advice>\<tx:attributes>\<tx:method>标签

              1. id 唯一标识

              2. transaction-manager 给事务通知提供一个事务管理器

             3. 配置AOP中的通用切入点表达式

             4. 建立事务通知和切入点表达式的对应关系

             5. 配置事务属性

              6. isolation 用于指定事务隔离级别，默认值DEFAULT，表示使用数据库的默认隔离级别

              7. propagation 用于指定事务的传播行为。

              8. read-only 用于指定事务是否只读，只有查询方法可以为true 默认为false

              9. timeout 用于指定事务超时时间，会自动回滚。默认为-1，表示永不超时，单位为秒。

              10. rollback-for/no-rollback-for 指定事务产生异常时回滚/不回滚

                  ```
                  运行时异常（非检查异常）：可以不用处理，默认都会滚
                  编译时异常（检查异常）：使用try-catch或throws解决
                  ```

        2. 注释事务控制

              1. 配置文件

                 ```xml
                 <!-- 启用事务注解 -->
                 <tx:annotation-driven transaction-manager="transactionManager"/>
                 ```

           2. 在需要进行事务控制的方法上加注解    @Transactional(*)

  4. 事务的隔离级别

      1. 数据库事务并发问题

          假设现在有两个事务：Transaction01和Transaction02并发执行。

          1.  **脏读**

              > 1. Transaction01将某条记录的AGE值从20修改为30
              > 2. Transaction02读取了Transaction01更新后的值：30.。
              > 3. Transaction01回滚，AGE值恢复到了20
              > 4. Transaction02读取到的30就是一个无效的值

          2. **不可重复读**

              > 1. Transaction01读取了AGE值为20。
              > 2. Transaction02将AGE值修改为30
              > 3. Transaction01再次读取AGE值为30，和第一次读取不一致。
              
          3.  **幻读**

              > 1. Transaction01读取了STUDENT表中的一部分数据。
              > 2. Transaction02向STUDENT表中插入了新的行。
              > 3. Transaction01读取了STUDENT表时，多出了一些行。

      2. 隔离级别

          数据库系统必须具有隔离并发运行各个事务的能力，使它们不会相互影响，避免各种并发问题。**一个事务与其他事务隔离的程度称为隔离级别**。SQL标准中规定了多种事务隔离级别，不同隔离级别对应不同的干扰程度，隔离级别越高，数据一致性就越好，但并发性越弱。

          1. **读未提交**：READ UNCOMMITTED

              允许Transaction01读取Transaction02未提交的修改。

          2. **读已提交**：READ COMMITTED

              要求Transaction01只能读取Transaction02已提交的修改。

          3. **可重复读**：REPEATABLE READ

              确保Transaction01可以多次从一个字段中读取到相同的值，即Transaction01执行期间禁止其它事务对这个字段进行更新。

          4. **串行化**：SERIALIZABLE

              确保Transaction01可以多次从一个表中读取到相同的行，在Transaction01执行期间，禁止其它事务对这个表进行添加、更新、删除操作。可以避免任何并发问题，但性能十分低下。

          5. 各个隔离级别解决并发问题的能力见下表
          
              |                  | 脏读 | 不可重复读 | 幻读 |
              | :--------------- | :--: | :--------: | :--: |
              | READ UNCOMMITTED |  有  |     有     |  有  |
              | READ COMMITTED   |  无  |     有     |  有  |
              | REPEATABLE READ  |  无  |     无     |  有  |
              | SERIALIZABLE     |  无  |     无     |  无  |
          
          6. 各种数据库产品对事务隔离级别的支持程度
          
              |                  | Oracle | MySQL   |
              | ---------------- | ------ | ------- |
              | READ UNCOMMITTED | ×      | √       |
              | READ COMMITTED   | √      | √       |
              | REPEATABLE READ  | ×      | √(默认) |
              | SERIALIZABLE     | √      | √       |
          
     3. 在Spring中指定事务隔离级别

          1. 注解

               用@Transactional注解声明式地管理事务时可以在@Transactional的isolation属性中设置隔离级别

5. 事务的传播行为

    1. 简介

        当事务方法被另一个事务方法调用时，必须指定事务应该如何传播。例如：方法可能继续在现有事务中运行，也可能开启一个新事务，并在自己的事务中运行。

        事务的传播行为可以由传播属性指定。Spring定义了7种类传播行为。

        ![img](file:///C:/Mr.Gao/学习笔记/Spring/images/clip_image002.jpg)

        事务传播属性可以在@Transactional注解的propagation属性中定义。

    2. 测试

        ![img](file:///C:/Mr.Gao/学习笔记/Spring/images/clip_image003.png)

    3. 说明

        1. REQUIRED传播行为

            当bookService的purchase()方法被另一个事务方法checkout()调用时，它默认会在现有的事务内运行。这个默认的传播行为就是REQUIRED。因此在checkout()方法的开始和终止边界内只有一个事务。这个事务只在checkout()方法结束的时候被提交，结果用户一本书都买不了。

            ![img](file:///C:/Mr.Gao/学习笔记/Spring/images/clip_image005.png)

        2. REQUIRES_NEW传播行为

            表示该方法必须启动一个新事务，并在自己的事务内运行。如果有事务在运行，就应该先挂起它。

            ![img](file:///C:/Mr.Gao/学习笔记/Spring/images/clip_image007.png)

    4. 补充

        在Spring 2.x事务通知中，可以像下面这样在<tx:method>元素中设定传播事务属性。

        ![img](file:///C:/Mr.Gao/学习笔记/Spring/images/clip_image009.png)