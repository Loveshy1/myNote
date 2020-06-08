# Mybatis
## 全局配置文件
1. properties 属性信息
	1. resource 引入类路径下的资源
	2. url 引入网络路径或磁盘下的资源
2. settings 设置信息
	1. 	setting 用来设置每一个项
		1. 	name 设置项名称
		2. 	value 设置项值
	2. mapUnderscoreToCamelCase 驼峰命名映射
	3. useColumnLabel 类标签代替列名
	4. lazyLoadingEnable 延迟加载
	5. aggressiveLazyLoading 全加载
3. typeAliases 别名处理器，不区分大小写
	1. typeAlias 为某个java类设置别名
		1. type 设置java类的全类名，
		2. alias 指定新的别名，默认为全小写
	2. package 为某个包下的所有类批量设置别名
		1. name 指定包名
		2. @Alias注解在java类中设置别名
4. plugings 
	1. Executor
	2. ParameterHandler
	3. ResultSetHandler
	4. StatementHandler
5. environments 环境配置 
	1. default 指定默认环境
	2. environment 单个环境配置标签
		
		1. id 代表唯一标识
	3. transactionManager 事务管理器
		1. type  事务管理器的类型 JDBC|MANAGED
		* 也可自定义事务管理器，实现TransactionFactory接口的全类名
	4. dataSource 数据源
		1. type 数据源类型 UNPOOLED|POOLED|JNDI
		* 实现DataSourceFactory接口的类
6. databaseIdProvider 支持不同数据库厂商
	1. type 获得驱动标识 DB_VENDOR
	2. property 别名标签
		1. name 厂商名 MySQL|Oracle|SQL Server
		2. value 别名，用于databaseId引用，优先使用有标识的
7. mappers 注册sql映射文件
	1. resource 引入类路径下的资源
	2. url 引入网络路径或磁盘下的资源
	3. class 引用接口文件
		1. 有sql映射文件，映射文件必须和接口同名且在同一文件夹下
		2. sql语句用注释写在接口里
	4. package 包注册，映射文件必须和接口同名且在同一文件夹下
## 映射文件
	 * 返回值 Integer|Long|Boolean|void
	 * openSession viod 手动提交|turn 自动提交
	 * ${}传参用于设置sql语句  
	 `select from ${year}_salary where id = #{id}`

   1. 传参规则
         *传入参数会被封装成map(param)，Conllection(conllection),List(list),数组(array) 
             1. 直接传入参数(1,2,value,vale) #{param1},#{param2}
                 2. 使用 @Param("key名") #{指定的key}
                 3. 传入pojo或map #{属性}
         2. insert
                 1. useGenerateKeys 获取自增主键 
                 2. keyProperty 设置自增主键的属性名
                 3. selectKey
                       1. KeyProperty 对应属性名
                           1. order BEFORE|AFTER selectKey执行的位序
                       2. resultType 结果类型
             
         3. update

         4. delete

         5. select 

                1. id 唯一标识，需与接口名相同

                2. resultType 返回值类型
             3. @MapKey("键名") 返回Map(键名,封装类型)

             4. parameterType 参数类型

             5. resultMap 返回值封装规则

                 * 适用于一对多
                   
                     > 1. id 唯一标识
                     > 2. property 指定对应的javaBean
                     > 3. column 数据库列名 property 属性名
                     > 4. association 联合属性 

               6. 联合类：以JavaType类型封装给property属性

                  1. 分布查询：使用select的指定方法，通过传入column参数，返回给property属性

                     ```xml
                     <association property="dept" 	select="com.atguigu.mybatis.dao.DepartmentMapper.getDeptById" column="d_id">
                     </association>
                     ```

                     ​	可适用于延迟加载fechType也可设置

                  2. collection 集合 

             7. 联合类：以ofType类型封装给property属性
                       1. 分布查询：使用select的指定方法，通过传入column参数，返回给property属性

                ```xml
                <association property="dept" select="com.atguigu.mybatis.dao.DepartmentMapper.getDeptById" column="d_id">
                	</association>
                ```

                >  可适用于延迟加载fechType也可设置
                >
                > 可适用于延迟加载，fechType也可设置

         6. discriminator 鉴别器

                 1. case value resultType

## 动态SQL

1. if
	1. 注意特殊转义符
	`<if type="id!=null and id &lt; 3">`

2. choose
	1. when
	2. otherwise

3. tirm

	1. prefix 给拼串后的整个字符串加一个前缀 

	2. prefixOverrides 去掉整个字符串前面多余的字符

	3. suffix 给拼串后的整个字符串加一个后缀 

	4. suffixOverrides 去掉整个字符串后面多余的字符

4. foreach

	1. collection 指定要遍历的集合,list类型的参数会特殊处理封装在map中，map的key就叫list

	2. item 将当前遍历出的元素赋值给指定的变量

	3. separator 每个元素之间的分隔符

	4. open 遍历出所有结果拼接一个开始的字符

	5. close 遍历出所有结果拼接一个结束的字符

	6. index 索引,遍历list的时候是index就是索引，item就是当前值
	*遍历map的时候index表示的就是map的key，item就是map的值

5. sql 数据库语句片段设置 *与select等同级
	1. id 唯一标识
	2. include 引用标签
		1. property name名称 ${property}

6. where标签
*自动去掉最前面的and或or

7. bind 变量赋值
`<bind name="_name" value="'%'+name+'%'">`

## Mybatis缓存

1. 一级缓存(本地缓存) sqlSession
	1. 一级缓存失效情况（没有使用到当前一级缓存的情况，效果就是，还需要再向数据库发出查询）：
		1. sqlSession不同。
 		2. sqlSession相同，查询条件不同.(当前一级缓存中还没有这个数据)
 		3. sqlSession相同，两次查询之间执行了增删改操作(这次增删改可能对当前数据有影响)
        4. sqlSession相同，手动清除了一级缓存（缓存清空）
2. 二级缓存(全局缓存)
	*cacheEnabled true 开启二级缓存
	*pojo需要实现序列化接口
	*每次增删改一二级缓存都会清空
	1. cache 配置标签
		1. eviction 回收策略
			* LRU – 最近最少使用
			* FIFO – 先进先出：按对象进入缓存的顺序来移除它们。
			* SOFT – 软引用：移除基于垃圾回收器状态和软引用规则的对象。
			* WEAK – 弱引用：更积极地移除基于垃圾收集器状态和弱引用规则的对象。
			* 默认的是 LRU。
		2. flushInterval 刷新时间间隔 毫秒
		3. readOnly 是否只读
			1. true 不会更改数据，速度快，不安全
			2. false 默认 反序列化克隆一个，速度慢，安全
		4. size 存放缓存数量
		5. type 指定自定义全类名，需实现Cache接口
			1. ehchae 第三方缓存
				*需要jar和xml