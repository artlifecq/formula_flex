package com.rpgGame.netData.task.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求开启宝箱任务
	 */
	public class ReqAcceptTreasureBoxTaskMessage extends Message {
	
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124206;
		}
		
	}
}