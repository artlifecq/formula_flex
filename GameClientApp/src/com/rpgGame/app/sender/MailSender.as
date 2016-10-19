package com.rpgGame.app.sender
{
	import com.rpgGame.coreData.info.item.ItemInfo;
	
	import app.cmd.MailModuleMessages;
	
	import org.game.netCore.connection.SocketConnection;

	/**
	 * @author lpp
	 * ModuleID==18
	 */
	public class MailSender extends BaseSender
	{
		public function MailSender()
		{
		}
		
		/**
		 * 设置邮件被读了
		 * varint32 邮件id
		 */	
		public static function reqSetMailReaded(mailId:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32( mailId );
			SocketConnection.send( MailModuleMessages.C2S_SET_MAIL_READED, _bytes );
		}	
			
		/**
		 * 请求领取邮件中的货币
		 *
		 * varint32 邮件id
		 *
		 * varint32 数值类型
		 */
		public static function reqCollectMailMoney( mailId:int, amountType:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32( mailId );
			_bytes.writeVarint32( amountType );
			SocketConnection.send( MailModuleMessages.C2S_COLLECT_MAIL_MONEY, _bytes );
		}
		
		/**
		 * 领取邮件中的物品
		 * varint32 邮件id
		 * varint32 第N个格子上面的物品奖励[N 从零开始]
		 */
		public static function reqCollectMailGoods( mailId:int, index:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32( mailId );
			_bytes.writeVarint32( index );
			SocketConnection.send( MailModuleMessages.C2S_COLLECT_MAIL_GOODS, _bytes );
		}
		
		/**
		 * 领取邮件中的所有东西
		 *
		 * varint32 邮件id
		 */
		public static function reqCollectMail( mailId:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32( mailId );
			SocketConnection.send( MailModuleMessages.C2S_COLLECT_MAIL, _bytes );
		}
		
		/**
		 * 一键领取所有邮件
		 * @param mailId
		 * @param index
		 * 
		 */		
		public static function reqCollectAllMail( isDelete:Boolean ):void
		{
			_bytes.clear();
			_bytes.writeBoolean( isDelete );
			SocketConnection.send( MailModuleMessages.C2S_COLLECT_ALL_MAIL , _bytes );
		}
		
		/**
		 * 删除邮件
		 * varint32 要删除的邮件id数量
		 * for(i->要删除的邮件id数量){
		 *      varint32 邮件id
		 * }
		 */
		public static function reqDeleteMail(mailIds:Array):void
		{
			_bytes.clear();
			var len:int = mailIds.length;
			_bytes.writeVarint32( len );
			for(var i:int = 0; i < len; i++ )
			{
				_bytes.writeVarint32( mailIds[i] );
			}
			SocketConnection.send( MailModuleMessages.C2S_DELETE_MAIL, _bytes );
		}
		
		/**
		 * 发送邮件
		 *
		 * varint64 目标id
		 *
		 * utf 邮件标题 utf 邮件内容
		 *
		 * varint32 发送银两数量
		 *
		 * while(readable()){ varint32 邮件的第N个格子
		 *
		 * varint32 物品在背包中的第N个格子
		 *
		 * varint32 物品id[用于验证]，物品只能是没有过期时间，同时非绑定的物品 }
		 */
		public static function reqSendMail( heroID:Number, title:String, info:String, money:int, items:Vector.<ItemInfo> ):void
		{
			_bytes.clear();
			_bytes.writeVarint64( heroID );
			_bytes.writeUTF( title );
			_bytes.writeUTF( info );
			_bytes.writeVarint32( money );
			
			if( items != null )
			{
				var len:int = items.length;
				var itemObject:ItemInfo;
				for( var i:int = 0; i < len; i++ )
				{
					itemObject = items[i];
					_bytes.writeVarint32( i );
					_bytes.writeVarint32( itemObject.index );
					_bytes.writeVarint32( itemObject.cfgId );
				}
			}
			
			SocketConnection.send( MailModuleMessages.C2S_SEND_MAIL , _bytes );
		}
		
		/**
		 * 设置是否拒绝接收邮件
		 * boolean true拒绝接收/false接收
		 */
		public static function reqSetRefuseReceiveMail( isRefuse:Boolean ):void
		{
			_bytes.clear();
			_bytes.writeBoolean( isRefuse );
			SocketConnection.send( MailModuleMessages.C2S_SET_REFUSE_RECEIVE_MAIL , _bytes );
		}
			
	}
}