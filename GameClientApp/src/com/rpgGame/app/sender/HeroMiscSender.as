package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.netData.client.bean.CustomTaginfo;
	import com.rpgGame.netData.client.message.ReqClientCustomTagSetMessage;
	
	import app.cmd.HeroMiscModuleMessages;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.connection.SocketConnection_protoBuffer;

	/**
	 *  
	 * @author Carver
	 * ModuleID==8
	 */	
	public class HeroMiscSender extends BaseSender
	{
		/**是否正在请求战力详情*/
		public static var isReqHeroFightingAmount:Boolean;
		
		public function HeroMiscSender()
		{
			super();
		}
		
		/**
		 * 设置客户端的数据
		 */
		
		public static function reqSetClientCustomTag(key :int, value :String):void
		{
			if ( key != 0 )
			{
				var msg :ReqClientCustomTagSetMessage = new ReqClientCustomTagSetMessage();
				msg.customTaginfo = new CustomTaginfo();
				msg.customTaginfo.key = key.toString();
				msg.customTaginfo.value = value;
				SocketConnection.send(msg);
			}
		}
		
		public static function reqChangePKMode(pkMode:uint):void
		{
			_bytes.clear();
			_bytes.writeVarint32(pkMode);
			SocketConnection_protoBuffer.send(HeroMiscModuleMessages.C2S_CHANGE_PK_MODE,_bytes);
		}
		
		public static function autoChgPkMode():void
		{
			MainRoleManager.actorInfo.pkMode++;
		}
		
		/**
		 * 请求英雄战斗力详情
		 */
		public static function reqHeroFightingAmountDetails():void
		{
			if(!isReqHeroFightingAmount)
			{
				isReqHeroFightingAmount = true;
				_bytes.clear();
//				SocketConnection.send(HeroMiscModuleMessages.C2S_HERO_FIGHTING_AMOUNT_DETAILS);
			}
		}
		
		/**
		 *  添加终生不重置的触发器id
		 *  附带
		 *  varint32 触发器id
		 */
		public static function reqAddNoLongerUsedTriggerId(triggerId:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(triggerId);
			//SocketConnection.send(HeroMiscModuleMessages.C2S_ADD_NO_LONGER_USED_TRIGGER_ID,_bytes);
		}
		
		/**
		 * 请求挂机今日成果，客户端需要缓存今日成果的数据
		 * 
		 * 如果此前的已经发送，则服务器不会返回任何数据
		 * 
		 * 客户端打开面板时，检测有没有缓存，如果没有任何今日成果缓存，则发送该消息给服务器，否则，使用缓存数据
		 * 
		 * 收到重置协议，如果客户端没有缓存，客户端不做处理；如果有缓存，客户端清空掉今日的物品收获，把今日收益放入历史收益列表中，今日收益置零
		 */
		public static function reqHookRecordInfo():void
		{
			_bytes.clear();
			//SocketConnection.send(HeroMiscModuleMessages.C2S_HERO_AUTO_COMBAT_RECORD ,_bytes);
		/**
		 * 请求挂机monsterid
		 */
		}
		public static function reqHookMonsterID():void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(HeroMiscModuleMessages.C2S_RECOMMEND_AUTO_MONSTER ,_bytes);
		}
	}
}