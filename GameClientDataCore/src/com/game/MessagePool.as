package com.game{
	
	import com.game.login.handler.ResCreateCharacterHandler;	import com.game.login.handler.ResErrorHandler;	import com.game.login.handler.ResHeartHandler;	import com.game.login.handler.ResLoginSuccessHandler;	import com.game.login.message.ResCreateCharacterMessage;	import com.game.login.message.ResErrorMessage;	import com.game.login.message.ResHeartMessage;	import com.game.login.message.ResLoginSuccessMessage;		import flash.utils.Dictionary;		import org.game.netCore.net.Handler;	import org.game.netCore.net.Message;
	

	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * 引用类列表
	 */
	public class MessagePool {
		//消息类字典
		private var messages:Dictionary = new Dictionary();
		//处理类字典
		private var handlers:Dictionary = new Dictionary();
		
		public function MessagePool(){
			register(100101, ResCreateCharacterMessage, ResCreateCharacterHandler);
			register(100102, ResLoginSuccessMessage, ResLoginSuccessHandler);
			register(100104, ResErrorMessage, ResErrorHandler);
			register(100106, ResHeartMessage, ResHeartHandler);
		}
		
		private function register(id: int, messageClass: Class, handlerClass: Class): void{
			messages[id] = messageClass;
			handlers[id] = handlerClass;
		}
		
		public function getMessage(id: int) : Message{
			if(messages[id] == null) return null;
			else return new messages[id] as Message;
		}
		
		public function getHandler(id: int) : Handler{
			if(handlers[id] == null) return null;
			else return new handlers[id] as Handler;
		}
	}
}