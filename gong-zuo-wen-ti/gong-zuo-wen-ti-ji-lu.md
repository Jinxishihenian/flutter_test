---
description: 平常工作中经常会发生的问题以及避免的方法记录。
---

# 工作问题记录

### flutter第一次编译过慢问题

第一次编译过慢可能是build.gradle文件下载依赖翻墙失败导致的，请做如下修改：  
打开android\build.gradle

1. `// 第一处位置`
2. `buildscript {`
3. `repositories {`
4. `google()`
5. `jcenter()`
6. `}`
7. `}`
8. `// 第二处位置`
9. `allprojects {`
10. `repositories {`
11. `google()`
12. `jcenter()`
13. `}`
14. `}`

替换：  


1. `// 第一处位置`
2. `buildscript {`
3. `repositories {`
4. `maven { url 'https://maven.aliyun.com/repository/google' }`
5. `maven { url 'https://maven.aliyun.com/repository/jcenter' }`
6. `maven { url 'http://maven.aliyun.com/nexus/content/groups/public'}`
7. `maven { url 'https://maven.aliyun.com/repository/gradle-plugin'}`
8. `}`
9. `}`
10. `// 第二处位置`
11. `allprojects {`
12. `repositories {`
13. `maven { url 'https://maven.aliyun.com/repository/google' }`
14. `maven { url 'https://maven.aliyun.com/repository/jcenter' }`
15. `maven { url 'http://maven.aliyun.com/nexus/content/groups/public'}`
16. `maven { url 'https://maven.aliyun.com/repository/gradle-plugin'}`
17. `}`
18. `}`

#### 如何查看技术文档

解决问题多看几遍文档始终不是什么坏事,不看文档导致出现的问题处理事件,往往比你看几遍文档的事件要多得多.

