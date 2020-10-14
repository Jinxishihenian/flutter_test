---
description: 这是设计模式笔记.
---

# 设计模式

#### 代理模式

_介绍:_  
      在代理模式（Proxy Pattern）中，一个类代表另一个类的功能。这种类型的设计模式属于结构型模式,在代理模式中，我们创建具有现有对象的对象，以便向外界提供功能接口.

_实现原理:_  
　　我们将创建一个 Image 接口和实现了 Image 接口的实体类。ProxyImage 是一个代理类，减少 RealImage 对象加载的内存占用,ProxyPatternDemo，我们的演示类使用 ProxyImage 来获取要加载的 Image 对象，并按照需求进行显示。

_例子:_  
image接口:

```java
/// image接口.
interface Image {
  void display();
}

```

实现image接口实体类:

```java
/// 创建实现接口的实体类.
class RealImage implements Image{
    private String fileName;
	
    public RealImage(String fileName){
	    this.fileName = fileName;
		loadFromDisk(fileName);
	}
	
	@Override 
	public void display(){
		System.out.println("Displaying"+fileName);
	}
	
	private void loadFromDisk(String fileName){
	    System.out.println("Loading"+fileName);
	}
}
```

realImage实体类的代理类:

```java
/// 代理接口ProxyImage.
class ProxyImage implements Image{
	private RealImage realImage;
	private String fileName;
	
	public ProxyImage(String fileName){
		this.fileName = fileName;
	}
	
	@Override 
	public void display(){
		if(realImage == null){
		   realImage = new RealImage(fileName);
		}
		realImage.display();
	}
	
}

```

代理类的实现:

```java
public class HelloWorld {
    public static void main(String []args) {
        System.out.println("Hello World!");
		Image image = new ProxyImage("test_10mb.jpg");
		// 图像将从磁盘加载.
		image.display();
		System.out.print("");
		// 图像不需要从磁盘加载.
		image.display();
    }
}
```



#### 责任链模式

_介绍：_  
　　顾名思义,责任链模式\(China of Responsibility Pattern\)为请求创建了一个接收者对象的链。这种模式给予请求的类型，对请求的发送者和接收者进行解耦。这种类型的设计模式属于行为型模式。

_实现:_  
　　我们创建抽象类 AbstractLogger，带有详细的日志记录级别。然后我们创建三种类型的记录器，都扩展了 AbstractLogger。每个记录器消息的级别是否属于自己的级别，如果是则相应地打印出来，否则将不打印并把消息传给下一个记录器。

_例子:  
1._创建抽象的记录器类:

```java
public abstract class AbstractLogger {
   public static int INFO = 1;
   public static int DEBUG = 2;
   public static int ERROR = 3;
 
   protected int level;
 
   //责任链中的下一个元素
   protected AbstractLogger nextLogger;
 
   public void setNextLogger(AbstractLogger nextLogger){
      this.nextLogger = nextLogger;
   }
 
   public void logMessage(int level, String message){
      if(this.level <= level){
         write(message);
      }
      if(nextLogger !=null){
         nextLogger.logMessage(level, message);
      }
   }
 
   abstract protected void write(String message);
   
}
```

2.创建扩展了记录器类的实体类:

```java
public class ConsoleLogger extends AbstractLogger {
 
   public ConsoleLogger(int level){
      this.level = level;
   }
 
   @Override
   protected void write(String message) {    
      System.out.println("Standard Console::Logger: " + message);
   }
}

public class ErrorLogger extends AbstractLogger {
 
   public ErrorLogger(int level){
      this.level = level;
   }
 
   @Override
   protected void write(String message) {    
      System.out.println("Error Console::Logger: " + message);
   }
}

public class FileLogger extends AbstractLogger {
 
   public FileLogger(int level){
      this.level = level;
   }
 
   @Override
   protected void write(String message) {    
      System.out.println("File::Logger: " + message);
   }
}
```

  
3.创建不同类型的记录器。赋予它们不同的错误级别，并在每个记录器中设置下一个记录器。每个记录器中的下一个记录器代表的是链的一部分:

```java
public class ChainPatternDemo {
   
   private static AbstractLogger getChainOfLoggers(){
 
      AbstractLogger errorLogger = new ErrorLogger(AbstractLogger.ERROR);
      AbstractLogger fileLogger = new FileLogger(AbstractLogger.DEBUG);
      AbstractLogger consoleLogger = new ConsoleLogger(AbstractLogger.INFO);
 
      errorLogger.setNextLogger(fileLogger);
      fileLogger.setNextLogger(consoleLogger);
 
      return errorLogger;  
   }
 
   public static void main(String[] args) {
      AbstractLogger loggerChain = getChainOfLoggers();
 
      loggerChain.logMessage(AbstractLogger.INFO, "This is an information.");
 
      loggerChain.logMessage(AbstractLogger.DEBUG, 
         "This is a debug level information.");
 
      loggerChain.logMessage(AbstractLogger.ERROR, 
         "This is an error information.");
   }
}
```

4.输出结果:

```java
Standard Console::Logger: This is an information.
File::Logger: This is a debug level information.
Standard Console::Logger: This is a debug level information.
Error Console::Logger: This is an error information.
File::Logger: This is an error information.
Standard Console::Logger: This is an error information.
```



