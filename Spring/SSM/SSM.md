# SSM

## SpringMVC

### 概述

1. 三层架构
	1. 表现层 Spring MVC
	2. 业务层 Spring框架
	3. 持久层 MyBatis
	
2. Model 模型

3. View 视图

4. Controller 控制器

5. springMVC优势
	1. **清晰的角色划分**
		1. 前端控制器（DispatcherServlet）
		2. 请求到处理器映射（HandlerMapping）
		3. 处理器适配器（HandlerAdapter）
		4. 视图解析器（ViewResolver）
		5. 处理器或页面控制器（Controller）
		6. 验证器（ Validator）
		7. 命令对象（Command  请求参数绑定到的对象就叫命令对象）
		8. 表单对象（Form Object 提供给表单展示和提交到的对象就叫表单对象）
	2. 分工明确，而且扩展点相当灵活，可以很容易扩展，虽然几乎不需要		
	3. 由于命令对象就是一个POJO，无需继承框架特定API，可以使用命令对象直接作为业务对象		
	4. 和Spring 其他框架无缝集成，是其它Web框架所不具备的	
	5. 可适配，通过HandlerAdapter可以支持任意的类作为处理器
	6. 可定制性，HandlerMapping、ViewResolver等能够非常简单的定制
	7. 功能强大的数据验证、格式化、绑定机制
	8. 利用Spring提供的Mock对象能够非常简单的进行Web层单元测试
	9. 本地化、主题的解析的支持，使我们更容易进行国际化和主题的切换
	10. 强大的JSP标签库，使JSP编写更容易
	
6. **SpringMVC 和 Struts2 的优略分析**

    > 1. 共同点：
    >
    >   > 1. 它们都是表现层框架，都是基于 MVC 模型编写的。
    >   > 2. 它们的底层都离不开原始 ServletAPI。
    >   > 3. 它们处理请求的机制都是一个核心控制器。
    > 2. 不同点：
    >   > 1. Spring MVC 的入口是 Servlet, 而 Struts2 是 Filter。
    >   > 2. Spring MVC 是基于方法设计的，而 Struts2 是基于类，Struts2 每次执行都会建一个动作类。所以 Spring MVC 会稍微比 Struts2 快些
    >   > 3. Spring MVC 使用更加简洁,同时还支持 JSR303, 处理 Ajax 的请求更方便

### @RequestMapping 请求映射

1. value/path 设置映射路径
2. method 指定请求方式
3. params 指定限制请求参数的条件，可以简单的判断 =|!
    * 不写的时候Spring框架会自动绑定并封装数据
    * 参数有多个复杂类型时，在先端页面name="user.name"
4. headers 指定请求头必须包含的数据

### 请求参数的绑定

1. 请求参数的绑定说明 

    1. 绑定机制 
        1. 表单提交的数据都是k=v格式的 username=haha&password=123
        2. SpringMVC的参数绑定过程是把表单提交的请求参数，作为控制器中方法的参数进行绑定的
        3. 要求：提交表单的name和参数的名称是相同的 
    2. 支持的数据类型
        1. 基本数据类型和字符串类型
        2. 实体类型（JavaBean）
        3. 集合数据类型（List、map集合等）
    
2. 基本数据类型和字符串类型 
    1. 提交表单的name和参数的名称是相同的 
    2. 区分大小写 
    
3. 实体类型（JavaBean） 
    1. 提交表单的name和JavaBean中的属性名称需要一致
    2. 如果一个JavaBean类中包含其他的引用类型，那么表单的name属性需要编写成：对象.属性 例如： address.name 
    
4. 给集合属性数据封装 
   
    1. JSP页面编写方式：list[0].属性
    
5. 请求参数中文乱码的解决 
   
    1. 在web.xml中配置Spring提供的过滤器类
    
    ```xml
    <filter>
    	<filter-name>characterEncodingFilter</filter-name>
    	<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filterclass>
    	<!-- 指定字符集 -->
    	<init-param>
    		<param-name>encoding</param-name>
    		<param-value>UTF-8</param-value>
    	</init-param>
    </filter>
    
    <filter-mapping>
    	<filter-name>characterEncodingFilter</filter-name>
    	<url-pattern>/*</url-pattern>
    </filter-mapping>
    ```
    
6. 自定义类型转换器
   
    1. 基本类型，复杂类型，自定义类可以自动封装
    
    2. 累心转换器
    
        1. 实现类型转换器 Converter<S,T>
    
        2. XMl配置 
    
            > class="ConversionServiceFactoryBean"
            >
            > <mvc:annotation-driven conversion-service="XXX"/>

7.  在控制器中使用原生的ServletAPI对象 
    
    1. 只需要在控制器的方法参数定义HttpServletRequest和HttpServletResponse对象

### 常用注解

1. @RequestParam
    1. 作用：把请求中的指定名称的参数传递给控制器中的形参赋值
    2. 属性
        1. value：请求参数中的名称
        2. required：请求参数中是否必须提供此参数，默认值是true，必须提供
    
2. @RequestBody    **异步刷新**
    1. 作用：用于获取请求体的内容（注意：get方法不可以） 
    2. 属性
        1. required：是否必须有请求体，默认值是true
    
3. @PathVariable    RESTful架构风格

    1. 作用：拥有绑定url中的占位符的。例如：url中有/delete/{id}，{id}就是占位符
    2. 属性
        1. value：指定url中的占位符名称
    3. Restful风格的URL
        1. 请求路径一样，可以根据不同的请求方式去执行后台的不同方法
        2. restful风格的URL优点
            1. 强调HTTP应当以资源为中心，并且规范了资源URI的风格；
            2. 规范了HTTP请求动作（PUT，POST等）的使用，具有对应的语义；
            3. 遵循REST规范的Web应用将会获得下面好处；
            4. URL具有很强可读性的，具有自描述性；
            5. 资源描述与视图的松耦合；
            6. 可提供OpenAPI，便于第三方系统集成，提高互操作性；
            7. 如果提供无状态的服务接口，可提高应用的水平扩展性；

4. @. RequestHeader

    1. 作用：获取指定请求头的值 
    2. 属性
        1. value：请求头的名称

5. @ CookieValue

    1. 作用：用于获取指定cookie的名称的值
    2. 属性
        1. value：cookie的名称

6. @ModelAttribute

    1. 作用

        1. 出现在方法上：表示当前方法会在控制器方法执行前线执行。

            ```java
            @ModelAttribute    // 修饰的方法有返回值
            public User showUser(String name) {}
            
            @ModelAttribute    // 修饰的方法没有返回值
            public void showUser(String name,Map<String, User> map) {}
            ```

        2. 出现在参数上：获取指定的数据给参数赋值。 

    2. 应用场景 

        1. 当提交表单数据不是完整的实体数据时，保证没有提交的字段使用数据库原来的数据

7. @ SessionAttributes注解

    1. 作用：用于多次执行控制器方法间的参数共享
    2. 属性
        1. value：指定存入属性的名称

### 响应数据和结果视图

1. 返回值分类
    1.  返回字符串
        1. Controller方法返回字符串可以指定逻辑视图的名称，根据视图解析器为物理视图的地址。
    2.  返回值是void
        1.  如果控制器的方法返回值编写成void，执行程序报404的异常，默认查找JSP页面没有找到。
            1. 默认会跳转到@RequestMapping(value="/finAll") findAll的页面。
        2. 可以使用Http实现请求转发或者重定向跳转到指定的页面
    3.  返回值是ModelAndView对象
        1. ModelAndView对象是Spring提供的一个对象，可以用来调整具体的JSP视图
        2. setViewName()设置视图页面名称

2.  **SpringMVC** 框架提供的转发和重定向

    1. forward 请求转发

        1. controller方法返回String类型，想进行请求转发也可以编写成

            ```java
            return "forward:/myContoller/findAll";
            return "forward:/WEB-INF/pages/success.jsp";
            ```

    2. redirect 重定向

        1. controller方法返回String类型，想进行重定向也可以编写成

        ```java
        return "redirect:/index.jsp";
        return "redirect:/user/findAll";
        ```

3.  **ResponseBody**响应json数据
    
    1. DispatcherServlet会拦截到所有的资源，导致一个问题就是静态资源（img、css、js）也会被拦截到，从而 不能被使用。解决问题就是需要配置静态资源不进行拦截，在springmvc.xml配置文件添加如下配置
        1. \< mvc:resources/>标签配置不过滤
            1. location元素表示webapp目录下的包下的所有文件
            2. mapping元素表示以/static开头的所有请求路径，如/static/a 或者/static/a/b
        
        ```xml
        <mvc:resources location="/css/" mapping="/css/**"/> <!-- 样式 -->
        <mvc:resources location="/images/" mapping="/images/**"/> <!-- 图片 -->
        <mvc:resources location="/js/" mapping="/js/**"/> <!-- javascript -->
        ```
        
    2. 使用@RequestBody获取请求体数据
    
    3. 使用@RequestBody注解把json的字符串转换成JavaBean的对象
    
    4. 使用@ResponseBody注解把JavaBean对象转换成json字符串，直接响应
    
        1. 要求方法需要返回JavaBean的对象
    
    5. json字符串和JavaBean对象互相转换的过程中，需要使用jackson的jar包
    
        1. **jackson-databind**    com.fasterxml.jackson.core
        2. jackson-core    com.fasterxml.jackson.core
        3. jackson-annotations    com.fasterxml.jackson.core

## SpringMVC实现文件上传

### 文件上传的回顾

1.  导入文件上传的jar包
    1. **commons-fileupload**    commons-fileupload
    2. commons-io    commons-io
2. 文件上传的必要前提
    1. form 表单的 enctype 取值必须是：multipart/form-data (默认值是:application/x-www-form-urlencoded) enctype:是表单请求正文的类型
    2. method 属性取值必须是 Post
    3. 提供一个文件选择域

```java
    public String fileuoload1(HttpServletRequest request) throws Exception {
        // 使用fileupload组件完成文件上传
        // 上传的位置
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        // 判断，该路径是否存在
        File file = new File(path);
        if(!file.exists()){
            // 创建该文件夹
            file.mkdirs();
        }
        // 解析request对象，获取上传文件项
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 解析request
        List<FileItem> items = upload.parseRequest(request);
        // 遍历
        for(FileItem item:items){
            // 进行判断，当前item对象是否是上传文件项
            if(item.isFormField()){
                // 说明普通表单向
            }else{
                // 说明上传文件项
                // 获取上传文件的名称
                String filename = item.getName();
                // 把文件的名称设置唯一值，uuid
                String uuid = UUID.randomUUID().toString().replace("-", "");
                filename = uuid+"_"+filename;
                // 完成文件上传
                item.write(new File(path,filename));
                // 删除临时文件
                item.delete();
            }
        }
        return "success";
    }
```

### SpringMVC传统方式文件上传

1.  .SpringMVC框架提供了MultipartFile对象，该对象表示上传的文件，要求变量名称必须和表单file标签的 name属性名称相同。

```java
    public String fileuoload2(HttpServletRequest request, MultipartFile upload) throws Exception {
        // 使用fileupload组件完成文件上传
        // 上传的位置
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        // 判断，该路径是否存在
        File file = new File(path);
        if(!file.exists()){
            // 创建该文件夹
            file.mkdirs();
        }
        // 说明上传文件项
        // 获取上传文件的名称
        String filename = upload.getOriginalFilename();
        // 把文件的名称设置唯一值，uuid
        String uuid = UUID.randomUUID().toString().replace("-", "");
        filename = uuid+"_"+filename;
        // 完成文件上传
        upload.transferTo(new File(path,filename));
        return "success";
    }
```

### SpringMVC跨服务器方式文件上传

1. 分服务器的目的 在实际开发中，我们会有很多处理不同功能的服务器。
    1. 应用服务器：负责部署我们的应用
    2. 数据库服务器：运行我们的数据库
    3. 缓存和消息服务器：负责处理大并发访问的缓存和消息
    4. 文件服务器：负责存储用户上传文件的服务器
2. 依赖jar包
    1. jersey-core    com.sun.jersey
    2. **jersey-client**    com.sun.jersey

```java
    public String fileuoload3(MultipartFile upload) throws Exception {
    // 定义上传文件服务器路径
    String path = "http://localhost:9090/uploads/";
    // 说明上传文件项
    // 获取上传文件的名称
    String filename = upload.getOriginalFilename();
    // 把文件的名称设置唯一值，uuid
    String uuid = UUID.randomUUID().toString().replace("-", "");
    filename = uuid+"_"+filename;
    // 创建客户端的对象
    Client client = Client.create();
    // 和图片服务器进行连接
    WebResource webResource = client.resource(path + filename);
    // 上传文件
    webResource.put(upload.getBytes());
    return "success";
}
```

## SpringMVC的异常处理

### 异常处理思路

1.  controller调用service，service调用dao，异常都是向上抛出的，最终有DispatcherServlet找异常处理器进 行异常的处理。

### SpringMVC的异常处理

1. 自定义异常类    继承Exception
2. 实现异常处理器    实现HandlerExceptionResolver
3. 配置异常处理器

## SpringMVC框架中的拦截器

###  拦截器的概述

1. SpringMVC框架中的拦截器用于对处理器进行预处理和后处理的技术。
2.  可以定义拦截器链，连接器链就是将拦截器按着一定的顺序结成一条链，在访问被拦截的方法时，拦截器链 中的拦截器会按着定义的顺序执行。
3.  拦截器和过滤器的功能比较类似，有区别
    1. 过滤器是Servlet规范的一部分，任何框架都可以使用过滤器技术。
    2. 拦截器是SpringMVC框架独有的。
    3. 过滤器配置了/*，可以拦截任何资源。 
    4. 拦截器只会对控制器中的方法进行拦截。
4. 拦截器也是**AOP思想**的一种实现方式
5. 想要自定义拦截器，需要实现HandlerInterceptor接口。

### 拦截器

1.  拦截器的概述

    1. SpringMVC框架中的拦截器用于对处理器进行预处理和后处理的技术。
    2. 可以定义拦截器链，连接器链就是将拦截器按着一定的顺序结成一条链，在访问被拦截的方法时，拦截器链 中的拦截器会按着定义的顺序执行。
    3. 拦截器和过滤器的功能比较类似，有区别 
        1. 过滤器是Servlet规范的一部分，任何框架都可以使用过滤器技术。
        2. 拦截器是SpringMVC框架独有的。
        3. 过滤器配置了/*，可以拦截任何资源。 4. 拦截器只会对控制器中的方法进行拦截。
        4. 拦截器也是AOP思想的一种实现方式
        5. 想要自定义拦截器，需要实现HandlerInterceptor接口。

2. **过滤器和拦截器的区别**

    1. 拦截器是基于java的反射机制的，而过滤器是基于函数回调。
    2. 拦截器不依赖与servlet容器，过滤器依赖与servlet容器。
    3. 拦截器只能对action请求起作用，而过滤器则可以对几乎所有的请求起作用。
    4. 拦截器可以访问action上下文、值栈里的对象，而过滤器不能访问。
    5. 在action的生命周期中，拦截器可以多次被调用，而过滤器只能在容器初始化时被调用一次。
    6. 拦截器可以获取IOC容器中的各个bean，而过滤器就不行，这点很重要，在拦截器里注入一个service，可以调用业务逻辑。

3. 拦截器实现

    1. 实现HandlerInterceptor接口
    2. 重写方法
    3. 框架配置 

    ```xml
    <!--- 配置拦截器 --->
    <mvc:interceptors>
        <mvc:interceptor>
            <!--- 配置拦截器黑名单 *通配符 --->
            <mvc:mapping path="/**"/>
            <!--- 配置拦截器白名单 --->
            <mvc:exclude-mapping path="/index"/>
            <mvc:exclude-mapping path="/login"/>
            <mvc:exclude-mapping path="/logout"/>
            <!-- 注册拦截器对象 -->
            <bean class="com.compoment.LoginHandlerInterceptor"/>
        </mvc:interceptor>
    </mvc:interceptors>
    ```

4.  HandlerInterceptor接口中的方法
    1. preHandle方法是controller方法执行前拦截的方法
        1. 可以使用request或者response跳转到指定的页面
        2. return true放行，执行下一个拦截器，如果没有拦截器，执行controller中的方法。
        3.  return false不放行，不会执行controller中的方法。
    2. postHandle是controller方法执行后执行的方法，在JSP视图执行前。
        1. 可以使用request或者response跳转到指定的页面 
        2. 如果指定了跳转的页面，那么controller方法跳转的页面将不会显示。
    3. postHandle方法是在JSP执行后执行
        1. request或者response不能再跳转页面了

## SSM

### 搭建整合环境

1. 搭建整合环境导入spring，springMVC，Mybatis jar包

### Spring框架代码的编写

1. 编写springContext配置文件，关闭包扫描中的Controller注解

### Spring整合SpringMVC框架

1.  搭建和测试SpringMVC的开发环境

    1. 在web.xml中配置DispatcherServlet前端控制器
    2. 在web.xml中配置DispatcherServlet过滤器解决中文乱码
    3.  创建springmvc.xml的配置文件，编写配置文件

2. Spring整合SpringMVC的框架

    1. 目的：在controller中能成功的调用service对象中的方法。
    2. 在项目启动的时候，就去加载applicationContext.xml的配置文件，在web.xml中配置 ContextLoaderListener监听器（该监听器只能加载WEB-INF目录下的applicationContext.xml的配置文 件）。

    ```xml
    <listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>
    <!-- 配置加载类路径的配置文件 -->
    <context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>classpath:applicationContext.xml</param-value>
    </context-param>
    
    ```

    3.  在controller中注入service对象，调用service方法完成业务控制。

### Spring整合MyBatis框架

1. 搭建MyBatis的环境
    1.  在web项目中编写SqlMapConfig.xml的配置文件，编写核心配置文件
    2. 为Dao接口的编写方法
2.  Spring整合MyBatis框架
    1.  目的：把sqlMapConfig.xml配置文件中的内容配置到applicationContext.xml配置文件中
    2. 在Dao接口中添加@Repository注解
    3. 在service中注入dao对象
    4.  配置Spring的声明式事务管理