package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.MailSender;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.MailEvent;
	import com.rpgGame.coreData.cfg.MailCfgData;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.heroSearch.HeroSearchData;
	import com.rpgGame.coreData.info.mail.MailInfo;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.netData.mail.bean.MailBriefInfo;
	import com.rpgGame.netData.mail.message.ResAllMailsMessage;
	import com.rpgGame.netData.mail.message.ResGetMailAttachmentSueccessMessage;
	import com.rpgGame.netData.mail.message.ResMailDetailInfoMessage;
	import com.rpgGame.netData.mail.message.ResRecevieNewMailMessage;
	import com.rpgGame.netData.mail.message.SCDeleteResultMessage;
	
	import app.message.AmountType;
	import app.message.Int64StringPairProto;
	import app.message.MailModuleObjClientProto;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	
	/**
	 *邮件MailManager
	 * @author lpp
	 * modify by Guodong.Zhang
	 * 
	 */
	public class MailManager
	{
		private static var _mailMap:HashMap = new HashMap();
		public static var recentMailTarget:Vector.<HeroSearchData> = new Vector.<HeroSearchData>();
		/**是否拒绝接收邮件**/
		public static var isRefuseReceiveMail:Boolean = false;
		
		public static function addMailInfo(info:MailInfo):void
		{
			if(info)
			{
				_mailMap.add(info.mailId,info);
				if(_mailMap.length > MailCfgData.MAX_MAIL_COUTN)
				{
					var maillArr:Array = _mailMap.getValues();
					maillArr.sort(sortMailList);
					var mailInfo:MailInfo = maillArr.pop();
					_mailMap.remove(mailInfo.mailId);
					MailSender.reqDeleteMail([mailInfo.mailId]);
				}
			}
		}
		
		public static function sortMailList(mailInfo1:MailInfo,mailInfo2:MailInfo):int
		{
			if(!mailInfo1.isRead && mailInfo2.isRead)
			{
				return -1;
			}
			else if(mailInfo1.isRead && !mailInfo2.isRead)
			{
				return 1;
			}
			if(mailInfo1.startTime < mailInfo2.startTime)
			{
				return 1;
			}
			else if(mailInfo1.startTime > mailInfo2.startTime)
			{
				return -1;
			}
			return 0;
		}
		
		public static function clearMail():void
		{
			_mailMap.clear();
		}
		
		/**
		 * 得到所有邮件，已经排序过了
		 * @return 
		 * 
		 */		
		public static function get mailList():Array
		{
			var list:Array = _mailMap.getValues();
			return list;		
		}
		
		public static function getMailInfoByID(id:int):MailInfo
		{
			return _mailMap.getValue(id);
		}
		
		public static function deleteInfo(id:int):MailInfo
		{
			var mailInfo:MailInfo = _mailMap.remove(id);
			return mailInfo;
		}
		
		/**
		 * 所有邮件中是否有没有领取的邮件
		 * @return 
		 * 
		 */		
		public static function hasFuJianNoGet():Boolean
		{
			var list:Array = _mailMap.getValues();
			var mail:MailInfo;
			for(var i:int = list.length -1 ;i >= 0; i-- )
			{
				mail = list[ i ];
				if ( mail.hasFuJianNoGet() )
					return true;
			}
			return false;
		}
		
		/**
		 * 是否有未读取的邮件
		 * @return 
		 * 
		 */		
		public static function hasUnReadMail():Boolean
		{
			var list:Array = _mailMap.getValues();
			var mail:MailInfo;
			for(var i:int = list.length -1 ;i >= 0; i-- )
			{
				mail = list[ i ];
				if ( !mail.isRead )
					return true;
			}
			return false;
		}
		
		/**
		 * 最近联系人改变了
		 * @param heroId
		 * @param heroName
		 * 
		 */		
		private static function addRecentTarget(heroId:Number, heroName:String):void
		{
			var mailRecentData:HeroSearchData;
			for(var i:int = recentMailTarget.length -1 ; i >= 0; i -- )
			{
				mailRecentData = recentMailTarget[i];
				if( mailRecentData.heroId == heroId )
				{
					recentMailTarget.splice( i, 1 );
					recentMailTarget.unshift(mailRecentData);
					return;
				}
			}
			mailRecentData = new HeroSearchData();
			mailRecentData.heroId = heroId;
			mailRecentData.heroName = heroName;
			recentMailTarget.unshift( mailRecentData );
			if( recentMailTarget.length > MailCfgData.mailTargetLimit )
			{
				recentMailTarget.pop();
			}
		}
		
		/**
		 * 设置登录时数据
		 * @param isRefuse
		 * 
		 */		
		public static function setLoginData(mailModuleObj:MailModuleObjClientProto):void
		{
			if(mailModuleObj == null)
			{
				return;
			}
			isRefuseReceiveMail = mailModuleObj.isRefuseReceiveMail;
			if(mailModuleObj.recentMailTargets)
			{
				var len:int = mailModuleObj.recentMailTargets.length;
				var pro:Int64StringPairProto;
				var recent:HeroSearchData;
				for(var i:int = 0; i< len; i++ )
				{
					pro = mailModuleObj.recentMailTargets[i];
					addRecentTarget(pro.key.toNumber(),pro.value);
				}
			}
		}
		
		
		//-------------------------------------------
		//---------------------消息
		
		public static function reqSetMailReaded( mailId:int ):void
		{
			var mail:MailInfo = getMailInfoByID(mailId);
			if( mail == null || mail.isRead )
				return;
			
			MailSender.reqSetMailReaded( mailId );
		}
		
		/**
		 * 设置邮件读取成功
		 * varint32 邮件id
		 */
		public static function onSetMailReaded( mailId:int ):void
		{
			var mail:MailInfo = getMailInfoByID(mailId);
			if( mail == null )
				return;
			
			mail.isRead = true;
			
			EventManager.dispatchEvent( MailEvent.MAIL_READ_STATUS_CHANGE );
		}
		
		/**
		 * 请求领取邮件中的银两
		 * varint32 邮件id
		 */
		public static function reqCollectMailMoney( mailId:int ):void
		{
			var mail:MailInfo = getMailInfoByID(mailId);
			if( mail == null || !mail.hasValueNoGet )
				return;
			
			MailSender.reqCollectMailMoney( mailId, AmountType.BAND_MONEY );
		}
		
		/**
		 * 领取邮件的银两成功
		 * varint32 邮件id
		 * 客户端将MailCollectInfo的is_collect_money设置为true
		 */
		public static function onCollectMailMoney( mailId:int ):void
		{
			var mail:MailInfo = getMailInfoByID(mailId);
			if( mail == null )
				return;
			mail.setValueCellected();
			
			EventManager.dispatchEvent( MailEvent.MAIL_COLLECT_CHANGE, mailId );
		}
		
		/**
		 * 领取邮件中的物品
		 * varint32 邮件id
		 * varint32 第N个格子上面的物品奖励[N 从零开始]
		 */
		public static function reqCollectMailGoods( mailId:int, index:int ):void
		{
			var mail:MailInfo = getMailInfoByID(mailId);
			if( mail == null || !mail.hasItemByPos( index ) )
				return;
			
			if( !mail.hasItemNoGet( index ) )
				return;
			
			MailSender.reqCollectMailGoods( mailId, index );
		}
		/**
		 * 领取邮件中的物品成功
		 * varint32 邮件id
		 * varint32 第N个格子上面的物品奖励[N 从零开始]
		 * 客户端将MailCollectInfo的collect_goods设置为 collect_goods |= 1 << N
		 */
		public static function onCollectMailGoods( mailId:int, index:int ):void
		{
			var mail:MailInfo = getMailInfoByID(mailId);
			if( mail == null )
				return;
			mail.setItemCellected(index) ;
			EventManager.dispatchEvent( MailEvent.MAIL_COLLECT_CHANGE, mailId );
		}
		
		/**
		 * 领取邮件成功
		 * varint32 邮件id
		 * 客户端将MailCollectInfo的is_collect_money设置为true
		 * 客户端将MailCollectInfo的collect_goods设置为 collect_goods = 0xFFFFFFFF
		 */
		public static function onCollectMail( mailId:int, dispatch:Boolean = true):void
		{
			var mail:MailInfo = getMailInfoByID(mailId);
			if( mail == null )
				return;
			
			mail.setValueCellected();
			mail.setItemCellected();
			if(dispatch)
			{
				EventManager.dispatchEvent( MailEvent.MAIL_COLLECT_CHANGE, mailId );
			}
		}
		
		/**
		 * 一键领取所有邮件
		 * @param mailId
		 * @param index
		 * 
		 */		
		public static function reqCollectAllMail( isDelete:Boolean ):void
		{
			if( !hasFuJianNoGet() )
			{
				NoticeManager.showHint( EnumHintInfo.MAIL_COLLECT_ALL_FAIL1 );
				return;
			}
			
			
			MailSender.reqCollectAllMail( isDelete );
		}
		
		/**
		 * 删除邮件成功
		 * varint32 要删除的邮件id数量
		 * for(i->要删除的邮件id数量){
		 *      varint32 邮件id
		 * }
		 */
		public static function onDeleteMailSuccess( mailId:int ):void
		{
			deleteInfo(mailId);
		}
		
		/**
		 * 发送邮件成功
		 */
		public static function onSendMail( heroId:Number, heroName:String ):void
		{
			addRecentTarget( heroId, heroName );
			
			EventManager.dispatchEvent( MailEvent.MAIL_SEND_SUCCESS );
		}
		
		/**
		 * 设置是否拒绝接收邮件成功
		 * boolean true拒绝接收/false接收
		 */
		public static function onSetRefuseReceiveMail( isRefuse:Boolean ):void
		{
			isRefuseReceiveMail = isRefuse;
		}
		
		
		/*
		新邮件相关
		* */
		
		/**所有邮件简要信息*/
		private static var _allMailList:Vector.<MailBriefInfo>=new Vector.<MailBriefInfo>();
		public static var isALL:Boolean;
		
		public static function getallMailList():Vector.<MailBriefInfo>
		{
			return _allMailList;
		}
		
		public static function getMailById(id:long):MailBriefInfo
		{
			if(_allMailList==null||_allMailList.length<=0) return null;
			for(var i:int=0;i<_allMailList.length;i++)
			{
				if(id.EqualTo(_allMailList[i].mailInfoId)) return _allMailList[i];
			}
			return null;
		}
		
		//获取未读邮件的数量
		public static function getNewMailNum():int
		{
			var num:int=0;
			if(_allMailList==null||_allMailList.length<=0) return num;
			for(var i:int=0;i<_allMailList.length;i++)
			{
				if(_allMailList[i].isRead==0)
				{
					num++;
				}
			}
			return num;
		}
		
		private static function setMailIsTiQu(id:long):void
		{
			if(_allMailList==null||_allMailList.length<=0) return;
			for(var i:int=0;i<_allMailList.length;i++)
			{
				if(id.EqualTo(_allMailList[i].mailInfoId))
				{
					_allMailList[i].items=null;
				}
			}
		}
		
		private static function isHaveMailById(mailid:long):Boolean
		{
			if(_allMailList==null||_allMailList.length<=0) return false;
			for(var i:int=0;i<_allMailList.length;i++)
			{
				if(mailid.EqualTo(_allMailList[i].mailInfoId)) return true;
			}
			return false;
		}
		
		private static function shortList(info1:MailBriefInfo,info2:MailBriefInfo):int
		{
			if(info1.sendTime.ToGID()>info2.sendTime.ToGID())
				return -1;
			else if(info1.sendTime.ToGID()<info2.sendTime.ToGID())
				return 1;
			return 0;
		}
		
		public static function setMailIsRead(id:long):void
		{
			if(_allMailList==null||_allMailList.length<=0) return;
			for(var i:int=0;i<_allMailList.length;i++)
			{
				if(id.EqualTo(_allMailList[i].mailInfoId))
				{
					_allMailList[i].isRead=1;
				}
			}
		}
		
		/**服务端发送所有邮件*/
		public static function resAllMailsMessage(msg:ResAllMailsMessage):void
		{
			_allMailList=msg.mailBriefInfos;
			_allMailList.sort(shortList);
		}
		
		/**展示某一个邮件的详细信息*/
		public static function resMailDetailInfoMessage(msg:ResMailDetailInfoMessage):void
		{
			EventManager.dispatchEvent( MailEvent.MAIL_DETAILED_INFORMATION,msg.mailDetailInfo);
		}
		
		/**提取附件成功后的消息*/
		public static function resGetMailAttachmentSueccessMessage(msg:ResGetMailAttachmentSueccessMessage):void
		{
			setMailIsTiQu(msg.mailId);
			setMailIsRead(msg.mailId);
			EventManager.dispatchEvent( MailEvent.MAIL_COLLECT_CHANGE,msg.mailId);
		}
		
		/**收到新邮件*/
		public static function resRecevieNewMailMessage(msg:ResRecevieNewMailMessage):void
		{
			if(!isHaveMailById(msg.mailInstance.mailInfoId))
			{
				_allMailList.push(msg.mailInstance);
				_allMailList.sort(shortList);
				EventManager.dispatchEvent(MailEvent.ADD_MAIL_DATA);
			}
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.MAIL_NEWMAIL);
		}
		
		/**删除邮件*/
		public static function resDeletMailMessage(msg:SCDeleteResultMessage):void
		{
			if(msg.result==1)
			{
				if(_allMailList!=null&&_allMailList.length>0)
				{
					for(var i:int=0;i<_allMailList.length;i++)
					{
						if(_allMailList[i].mailInfoId.EqualTo(msg.mailId))
						{
							_allMailList.removeAt(i);
						}
					}
					EventManager.dispatchEvent(MailEvent.DEL_MAIL_DATA);
				}
			}
		}
	} 
}