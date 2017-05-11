package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.MailManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.MailEvent;
	import com.rpgGame.coreData.cfg.MailCfgData;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.mail.MailInfo;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.netData.mail.message.ResAllMailsMessage;
	import com.rpgGame.netData.mail.message.ResGetMailAttachmentSueccessMessage;
	import com.rpgGame.netData.mail.message.ResMailDetailInfoMessage;
	import com.rpgGame.netData.mail.message.ResRecevieNewMailMessage;
	import com.rpgGame.netData.mail.message.SCDeleteResultMessage;
	
	import flash.utils.ByteArray;
	
	import app.message.MailCollectProto;
	import app.message.MailProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net_protobuff.ByteBuffer;
	import org.game.netCore.net_protobuff.BytesUtil;
	
	/**
	 * 邮件收到server端协议处理
	 * @author Guodong.Zhang
	 * 
	 */
	public class MailCmdListener extends BaseBean
	{
		public function MailCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_NEW_MAIL,onNewMail);
			//			
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_SET_MAIL_READED_FAIL, onSetMailReadedFail );
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_SET_MAIL_READED, onSetMailReaded );
			//			
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_COLLECT_MAIL_MONEY_FAIL,onCollectMailMoneyFail );
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_COLLECT_MAIL_MONEY,onCollectMailMoney );
			//			
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_COLLECT_MAIL_GOODS_FAIL,onCollectMailGoodsFail);
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_COLLECT_MAIL_GOODS,onCollectMailGoods);
			//			
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_COLLECT_MAIL_FAIL,onCollectMailFail);
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_COLLECT_MAIL, onCollectMail);
			//			
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_COLLECT_ALL_MAIL_FAIL, onCollectALlMailFail);
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_COLLECT_ALL_MAIL, onCollectALlMail);
			//			
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_DELETE_MAIL_FAIL, onDeleteMailFail );
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_DELETE_MAIL_SUCCESS, onDeleteMailSuccess);
			//			
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_SEND_MAIL_FAIL, onSendMailFail );
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_SEND_MAIL, onSendMail );
			//			
			//			SocketConnection_protoBuffer.addCmdListener(MailModuleMessages.S2C_SET_REFUSE_RECEIVE_MAIL, onSetRefuseReceiveMail );
			SocketConnection.addCmdListener(120101, onResAllMailsMessage);
			SocketConnection.addCmdListener(120104, onResGetMailAttachmentSueccessMessage);
			SocketConnection.addCmdListener(120102, onResMailDetailInfoMessage);
			SocketConnection.addCmdListener(120103, onResRecevieNewMailMessage);
			SocketConnection.addCmdListener(120105, onSCDeleteResultMessage);
			finish();
		}
		
		/**
		 * 收到新邮件，附带以下内容 while(byteArray.availiable){ varint32 mailId 邮件ID varint32
		 * MailProto数据的长度 bytes MailProto数据
		 *
		 * if(!byteArray.availiable){ 邮件没有被读 break; } else {
		 *
		 * varint32 MailCollectProto数据的长度 bytes MailCollectProto数据 } } }
		 */
		private function onNewMail(buffer:ByteBuffer):void
		{
			var mailId:int;
			var len:int;
			var bytes:ByteArray;
			var mailProto:MailProto;
			var collectProto:MailCollectProto;
			var mailInfo:MailInfo;
			while(buffer.bytesAvailable)
			{
				mailId = buffer.readVarint32();
				len = buffer.readVarint32();
				
				bytes = new ByteArray();
				buffer.readBytes(bytes, 0, len);
				mailProto = new MailProto();
				mailProto.mergeFrom(bytes);
				
				mailInfo = new MailInfo( mailId, mailProto );
				mailInfo.endTime = MailCfgData.mailExpireTime + mailInfo.startTime;
				
				MailManager.addMailInfo( mailInfo );
				
				if( buffer.bytesAvailable > 0)
				{
					len = buffer.readVarint32();
					if( len > 0 )
					{
						bytes = new ByteArray();
						buffer.readBytes(bytes, 0, len);
						collectProto = new MailCollectProto();
						collectProto.mergeFrom(bytes);
						mailInfo.setFuJianStatus(collectProto);
					}
				}
			}
			EventManager.dispatchEvent( MailEvent.ADD_MAIL_DATA );
			if(!AppManager.isAppInScene(AppConstant.MAIL_PANEL))
			{
				if(MailManager.hasUnReadMail())
				{
					EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.MAIL_TYPE);
				}
			}
		}
		
		/**
		 * 设置邮件被读失败，返回varint32错误码
		 * 1. 邮件没找到
		 * 2. 邮件已经被设置为被读
		 */
		private function onSetMailReadedFail( buffer:ByteBuffer ):void
		{
			var failID:int = buffer.readVarint32();
			switch( failID )
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.MAIL_SET_READ_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.MAIL_SET_READ_FAIL2 );
					break;
			}
		}
		
		/**
		 * 设置邮件读取成功
		 * varint32 邮件id
		 */
		private function onSetMailReaded( buffer:ByteBuffer ):void
		{
			var mailId:int = buffer.readVarint32();
			
			MailManager.onSetMailReaded( mailId );
		}
		
		/**
		 * 领取邮件奖励失败，返回varint32错误码
		 *
		 * 1. 邮件没找到
		 * 2. 银两已经领取
		 * 3. 没有银两可以领取
		 * 4. 银两已满，无法领取
		 */
		private function onCollectMailMoneyFail( buffer:ByteBuffer ):void
		{
			var failID:int = buffer.readVarint32();
			switch( failID )
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_MONEY_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_MONEY_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_MONEY_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_MONEY_FAIL4 );
					break;
			}
		}
		
		/**
		 * 领取邮件的银两成功
		 * varint32 邮件id
		 * 客户端将MailCollectInfo的is_collect_money设置为true
		 */
		private function onCollectMailMoney( buffer:ByteBuffer ):void
		{
			var mailId:int = buffer.readVarint32();
			
			MailManager.onCollectMailMoney( mailId );
			
			NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_MONEY );
		}
		
		/**
		 * 领取邮件中的物品失败，返回varint32错误码
		 * 1. 邮件没找到
		 * 2. 物品已经领取
		 * 3. 没有物品可以领取
		 * 4. 背包已满
		 */
		private function onCollectMailGoodsFail( buffer:ByteBuffer ):void
		{
			var failID:int = buffer.readVarint32();
			switch( failID )
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_MONEY_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_GOODS_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_GOODS_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.BACKPACK_GRID_FAIL1 );
					break;
			}
		}
		
		/**
		 * 领取邮件中的物品成功
		 * varint32 邮件id
		 * varint32 第N个格子上面的物品奖励[N 从零开始]
		 * 客户端将MailCollectInfo的collect_goods设置为 collect_goods |= 1 << N
		 */
		private function onCollectMailGoods( buffer:ByteBuffer ):void
		{
			MailManager.onCollectMailGoods( buffer.readVarint32(), buffer.readVarint32() );
			
			NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_GOODS );
		}
		
		
		private function onCollectMailFail( buffer:ByteBuffer ):void
		{
			var failID:int = buffer.readVarint32();
			switch( failID )
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_MONEY_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.BACKPACK_GRID_FAIL1 );
					break;
			}
		}
		
		/**
		 * 领取邮件成功
		 * varint32 邮件id
		 * 客户端将MailCollectInfo的is_collect_money设置为true
		 * 客户端将MailCollectInfo的collect_goods设置为 collect_goods = 0xFFFFFFFF
		 */
		private function onCollectMail( buffer:ByteBuffer ):void
		{
			MailManager.onCollectMail( buffer.readVarint32() );
		}
		
		/**
		 * 一键领取所有邮件失败，可能有部分邮件是领取成功的，
		 *
		 * 返回varint32错误码(1. 没有邮件可以领取 2. 背包已满 3. 货币已满)
		 * 返回 bool 是否领取后删除
		 *
		 * while(readable()){ varint32 邮件id
		 * 客户端将MailCollectInfo的is_collect_money设置为true
		 * 客户端将MailCollectInfo的collect_goods设置为 collect_goods = 0xFFFFFFFF
		 * 同时该邮件已经被读了 }
		 */
		private function onCollectALlMailFail( buffer:ByteBuffer ):void
		{
			var failID:int = buffer.readVarint32();
			switch( failID )
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_ALL_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.BACKPACK_GRID_FAIL1 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.MONEY_FULL );
					break;
			}
			var toDelete:Boolean = buffer.readBoolean();
			while(buffer.bytesAvailable)
			{
				var mailID:int = buffer.readVarint32();
				if(toDelete)
				{
					MailManager.onDeleteMailSuccess(mailID);
				}
				else
				{
					MailManager.onCollectMail(mailID,false);
				}
			}
			if(toDelete)
			{
				EventManager.dispatchEvent( MailEvent.DEL_MAIL_DATA );
			}
			else
			{
				EventManager.dispatchEvent( MailEvent.MAIL_ALL_COLLECT_CHANGE );
			}
		}
		
		/**
		 * 一键领取邮件成功
		 *  返回 bool 是否领取后删除
		 *
		 * while(readable()){ varint32 邮件id
		 * 客户端将MailCollectInfo的is_collect_money设置为true
		 * 客户端将MailCollectInfo的collect_goods设置为 collect_goods = 0xFFFFFFFF
		 * 同时该邮件已经被读了 }
		 */
		private function onCollectALlMail( buffer:ByteBuffer ):void
		{
			var toDelete:Boolean = buffer.readBoolean();
			while( buffer.bytesAvailable )
			{
				var mailID:int = buffer.readVarint32();
				if(toDelete)
				{
					MailManager.onDeleteMailSuccess(mailID);
				}
				else
				{
					MailManager.onCollectMail(mailID, false);
				}
			}
			if(toDelete)
			{
				EventManager.dispatchEvent( MailEvent.DEL_MAIL_DATA );
			}
			else
			{
				EventManager.dispatchEvent( MailEvent.MAIL_ALL_COLLECT_CHANGE );
			}
		}
		
		/**
		 * 删除邮件失败
		 */
		private function onDeleteMailFail( buffer:ByteBuffer ):void
		{
			NoticeManager.showHint( EnumHintInfo.MAIL_DELETE_FAIL );
		}
		
		/**
		 * 删除邮件成功
		 * 
		 * while(readable){
		 *      varint32 邮件id
		 * }
		 */
		private function onDeleteMailSuccess( buffer:ByteBuffer ):void
		{
			while( buffer.bytesAvailable )
			{
				MailManager.onDeleteMailSuccess( buffer.readVarint32() );
			}
			EventManager.dispatchEvent( MailEvent.DEL_MAIL_DATA );
		}
		
		/**
		 * 发送失败，返回varint32错误码
		 *
		 * 1. 目标没找到
		 * 2. 邮件标题长度非法
		 * 3. 邮件内容长度非法
		 * 4. 邮寄银两数量非法
		 * 5. 邮寄物品位置非法
		 * 6. 银两不够
		 */
		private function onSendMailFail( buffer:ByteBuffer ):void
		{
			var failID:int = buffer.readVarint32();
			switch( failID )
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.MAIL_SEND_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.MAIL_SEND_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.MAIL_SEND_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.MAIL_SEND_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.MAIL_SEND_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.MAIL_SEND_FAIL6 );
					break;
				
				case 7:
					NoticeManager.showHint( EnumHintInfo.MAIL_SEND_FAIL7 );
					break;
				case 8:
					NoticeManager.showHint( EnumHintInfo.MAIL_SEND_FAIL8 );
					break;
			}
		}
		
		/**
		 * 发送邮件成功
		 *
		 * varint64 目标id
		 * bytes 目标名字
		 *
		 * 客户端将玩家id，名字添加进最近联系人里面
		 */
		private function onSendMail( buffer:ByteBuffer ):void
		{
			var targetID:Number = buffer.readVarint64();
			var targetName:String = BytesUtil.readRemainUTF( buffer );
			NoticeManager.showHint( EnumHintInfo.MAIL_SEND_SUCCESS );
			MailManager.onSendMail( targetID, targetName );
		}
		
		/**
		 * 设置是否拒绝接收邮件成功
		 * boolean true拒绝接收/false接收
		 */
		private function onSetRefuseReceiveMail( buffer:ByteBuffer ):void
		{
			MailManager.onSetRefuseReceiveMail( buffer.readBoolean() );
		}
		
		/*新邮件相关*/
		private function onResAllMailsMessage(msg:ResAllMailsMessage):void
		{
			MailManager.resAllMailsMessage(msg);
		}		
		
		private function onResGetMailAttachmentSueccessMessage(msg:ResGetMailAttachmentSueccessMessage):void
		{
			MailManager.resGetMailAttachmentSueccessMessage(msg);
		}
		
		private function onResMailDetailInfoMessage(msg:ResMailDetailInfoMessage):void
		{
			MailManager.resMailDetailInfoMessage(msg);
		}	
		
		private function onResRecevieNewMailMessage(msg:ResRecevieNewMailMessage):void
		{
			MailManager.resRecevieNewMailMessage(msg);
		}	
		
		private function onSCDeleteResultMessage(msg:SCDeleteResultMessage):void
		{
			MailManager.resDeletMailMessage(msg);
		}	
	}
}