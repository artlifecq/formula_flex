package com.rpgGame.app.sender
{
	

	public class CrownSender extends BaseSender
	{
		public function CrownSender()
		{
		}
		/**
		 * 投票 
		 * @param isVote 是否投票了
		 * @param b 投票结果
		 * 
		 */		
		public static function onCountryVote(isVote : Boolean,b:Boolean = true):void
		{
			_bytes.clear();
			if(isVote)
			{
				_bytes.writeBoolean(b);
			}
//			send(CountryModuleMessages.C2S_COUNTRY_VOTE,_bytes);
		}
		/**
		 * 囚禁目标
		 * 
		 * varint32 囚禁时长类型的下标
		 * varint64 目标id
		 */
		public static function onCaptivity(index:int,id:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint32(index);
			_bytes.writeVarint64(id);
//			send(CountryModuleMessages.C2S_CAPTIVITY, _bytes);
		}
		/**
		 * 禁言
		 * 
		 * varint32 禁言时长类型的下标
		 * varint64 目标玩家id
		 */
		public static function onSetDontTalk(index:int,id:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint32(index);
			_bytes.writeVarint64(id);
//			send(CountryModuleMessages.C2S_SET_DONT_TALK, _bytes);
		}
		/**
		 * 捐款 
		 * @param v int
		 * 
		 */		
		public static function onDoDonate(v:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(v);
//			send(CountryModuleMessages.C2S_DO_DONATE, _bytes);
		}
		/**
		 * 国家募捐 
		 * 
		 */		
		public static function onCountryDonate(text:String=""):void
		{
			_bytes.clear();
			_bytes.writeUTFBytes(text);
//			send(CountryModuleMessages.C2S_COUNTRY_DONATE, _bytes);
		}
		/**
		 * 请求禁卫公告，上线时/或者收到国家公告变更，清除缓存
		 */
		public static function getJinWeiAnnouncement():void
		{
			_bytes.clear();
//			send(CountryModuleMessages.C2S_GET_JIN_WEI_ANNOUNCEMENT, _bytes);
		}
		/**
		 * 设置禁卫公告，长度不能够超过100个字节
		 * 
		 * bytes
		 */
		public static function setJinWeiAnnouncement(str : String):void
		{
			_bytes.clear();
			_bytes.writeUTFBytes(str);
//			send(CountryModuleMessages.C2S_SET_JIN_WEI_ANNOUNCEMENT, _bytes);
		}
		/**
		 * 领取自己的职位俸禄
		 */
		public static function getCollectSalary():void
		{
			_bytes.clear();
//			send(CountryModuleMessages.C2S_COLLECT_SALARY, _bytes);
		}
		
		/**
		 * 请求国家公告，上线时/或者收到国家公告变更，清除缓存
		 */
		public static function getAnnouncement():void
		{
			_bytes.clear();
//			send(CountryModuleMessages.C2S_GET_COUNTRY_ANNOUNCEMENT, _bytes);
		}
		/**
		 * 设置国家公告，长度不能够超过100个字节
		 * 
		 * bytes
		 */
		public static function setAnnouncement(str : String):void
		{
			_bytes.clear();
			_bytes.writeUTFBytes(str);
//			send(CountryModuleMessages.C2S_SET_COUNTRY_ANNOUNCEMENT, _bytes);
		}
	}
}