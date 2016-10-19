package com.rpgGame.app.sender
{
	import app.cmd.BiaoModuleMessages;
	

	/**
	 * 运镖 
	 * @author wewell
	 * 
	 */	
	public class YunBiaoSender extends BaseSender
	{
		/**
		 * 放弃运镖 
		 */
		public static function giveUpYunBiao() : void
		{
			_bytes.clear();
			send(BiaoModuleMessages.C2S_GIVE_UP_PERSONAL_BIAO, _bytes);
		}
		
		/**
		 * 请求传送到自己镖车旁边
		 */
		public static function transportToSelfBiao() : void
		{
			_bytes.clear();
			send(BiaoModuleMessages.C2S_TRANSPORT_TO_SELF_BIAO, _bytes);
		}
		
		
		/**
		 * 开启帮会运镖
		 * varint32 quality 0:本国 1：他国
		 */
		public static function requestGuildYunBiao($country:int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32($country);
			//send(BiaoModuleMessages.C2S_REQUEST_GUILD_YUN_BIAO, _bytes);
		}
		
		/**
		 * 提交帮会运镖
		 */
		public static function submitGuildYunBiao() : void
		{
			_bytes.clear();
			//send(BiaoModuleMessages.C2S_GUILD_SUBMIT_YUN_BIAO, _bytes);
		}
		
		/**
		 * 运镖召集帮众
		 */
		public static function guildYunBiaoHelp() : void
		{
			_bytes.clear();
			//send(BiaoModuleMessages.C2S_GUILD_YUN_BIAO_HELP, _bytes);
		}
		
		/**
		 * 请求传送到帮会飙车旁边
		 */
		public static function goToGuildBiaoChe() : void
		{
			_bytes.clear();
			//send(BiaoModuleMessages.C2S_GO_TO_GUILD_BIAO_CHE, _bytes);
		}
		
		/**
		 * 个人运镖请求帮会的人帮忙
		 */
		public static function yunBiaoHelp() : void
		{
			_bytes.clear();
			//send(BiaoModuleMessages.C2S_YUN_BIAO_HELP, _bytes);
		}
		
		/**
		 * 请求帮会活跃度
		 */
		public static function requestGuildActiveValue() : void
		{
			_bytes.clear();
			//send(BiaoModuleMessages.C2S_REQUEST_GUILD_ACTIVE_VALUE, _bytes);
		}
		
		/**
		 * 请求个人运镖奖励道具id 
		 */
		public static function requestYunBiaoLevelGoodsId() : void
		{
			_bytes.clear();
			//send(BiaoModuleMessages.C2S_REQUEST_YUN_BIAO_LEVEL_GOOD_ID, _bytes);
			
		}

		/**
		 * 请求传输到帮会中发起个人运镖帮助的那个人身边 
		 * @param $globalId 索引id
		 */
		public static function requestPersionalGuildHelpTransport($globalId:int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32($globalId);
			//send(BiaoModuleMessages.C2S_REQUEST_PERSIONAL_GUILD_HELP_TRANSPORT, _bytes);
		}
		
		/**
		 * 请求国家运镖
		 * 
		 * 错误码：
		 * 1.你没有国家
		 * 2.当前国家任务不是运镖
		 * 3.运镖功能没有开启
		 * 4.你是在国外
		 * 5.距离NPC太远
		 * 6.当前有运镖任务
		 */
		public static function requestCountryYunBiao():void
		{
			_bytes.clear();
			//send( BiaoModuleMessages.C2S_REQUEST_COUNTRY_YUNBIAO, _bytes );
		}
		
		/**
		 * 检查国家运镖
		 * 
		 * 错误码：
		 * 1.当前没有运镖任务
		 * 2.已经没有检查点了
		 * 3.距离NPC太远
		 * 4.当前镖车不是国家镖车
		 */
		public static function checkCountryYunBiao():void
		{
			_bytes.clear();
			//send( BiaoModuleMessages.C2S_CHECK_COUNTRY_YUN_BIAO, _bytes );
		}
		
		/**
		 * 
		 * 错误码：
		 * 1.当前没有运镖任务,或者当前的镖车不是国家镖
		 * 2.镖车已经损毁，不可以刷新
		 * 3.你已经刷新过了
		 * 4.已经没有检查点了
		 * 5.已经是最高品质了
		 * 6.距离NPC太远
		 */
		public static function refreshCountryBiaoChe():void
		{
			_bytes.clear();
			//send( BiaoModuleMessages.C2S_REFRESH_COUNTRY_BIAO_CHE, _bytes );
		}
		
		/**
		 * 提交国家镖车
		 * 
		 * 错误码：
		 * 1.当前没有运镖任务
		 * 2.距离NPC太远
		 * 3.镖车距离NPC太远
		 */
		public static function submitCountryYunBiao():void
		{
			_bytes.clear();
			//send( BiaoModuleMessages.C2S_SUBMIT_COUNTRY_YUN_BIAO, _bytes );
		}
		
		/**
		 * 上或者下镖车
		 *
		 * bool true(上镖车)/false(下镖车)
		 */
		public static function requestUpOrDownFromBiao( bool:Boolean, posx:int=0, posy:int=0 ):void
		{
			_bytes.clear();
			_bytes.writeBoolean( bool );
			if( !bool )
			{
				_bytes.writeVarint32(posx);
				_bytes.writeVarint32(posy);
			}
			send( BiaoModuleMessages.C2S_UP_OR_DOWN_FROM_BIAO, _bytes );
		}
	}
}
