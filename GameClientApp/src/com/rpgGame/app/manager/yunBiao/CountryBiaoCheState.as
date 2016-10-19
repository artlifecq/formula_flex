package com.rpgGame.app.manager.yunBiao
{
	import com.game.engine3D.utils.TimeUtil;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.YunBiaoSender;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import flash.utils.Dictionary;
	
	import org.client.mainCore.manager.EventManager;

	/** 国家任务镖车 **/
	public class CountryBiaoCheState extends BiaoCheStateBase
	{
		/** 检查运镖的npc id，最后一个是交镖的 **/
		public var checkYunBiaoNpcId:Vector.<int>;
		private var _arrPrizeCount:Array = [];
		private var _dicEnemy:Dictionary = new Dictionary(); 
		private var _preShowHelpTime:Number = 0;
		private var _submitNpcId:Vector.<int>;
		private var _country:int = -1;
		
		public function CountryBiaoCheState()
		{
			super();
		}
		
		public function init($yunBiaoConfig:*) : void
		{
			getNpcId = $yunBiaoConfig.countryGetYunBiaoNpcId;
			checkYunBiaoNpcId = new Vector.<int>();
			_submitNpcId = new Vector.<int>();
			var len:int = $yunBiaoConfig.countryCheckYunBiaoNpcId.length;
			for (var idx:int=0; idx<len; idx++)
			{
				checkYunBiaoNpcId.push($yunBiaoConfig.countryCheckYunBiaoNpcId[idx]);
			}
			checkPoint = 0;
			
			len = $yunBiaoConfig.countrySubmitYunBiaoNpcId.length;
			for( idx = 0; idx < len; idx++ )
			{
				_submitNpcId.push( $yunBiaoConfig.countrySubmitYunBiaoNpcId[idx] );
			}
			
			len = $yunBiaoConfig.countryBiaoCheQualityPrizeCount.length;
			for (idx=0; idx<len; idx++)
			{
				_arrPrizeCount.push($yunBiaoConfig.countryBiaoCheQualityPrizeCount[idx]);
			}
		}
		
		/** 设置国家运镖提交npc **/
		public function initSubmitNpc( country:int ):void
		{
			if( _country < 0 )
			{
				checkYunBiaoNpcId.push(_submitNpcId[country]);
				_country = country;
			}
		}
		
		/** 更新国家运镖提交npc，用于移民 **/
		public function changeSubmitNpc( country:int ):void
		{
			if( _country >= 0 )
			{
				checkYunBiaoNpcId.pop();
				checkYunBiaoNpcId.push(_submitNpcId[country]);
				_country = country;
			}
		}
		
		public function getSubmitYunBiaoNpcId() : int
		{
			return checkYunBiaoNpcId[checkYunBiaoNpcId.length-1];
		}
		
		public function getPrizeCount($quality:int) : int
		{
			return _arrPrizeCount[$quality];
		}
		
		/**
		 * 添加一个敌人  
		 * @param $enemyId 敌人id
		 * @author 康露 2015年1月4日 
		 */
		public function addEnemy($enemyId:Number) : void
		{
			_dicEnemy[$enemyId] = true;
			addFaceIcon($enemyId);
		}
		
		public function addFaceIcon($enemyId:Number) : void
		{
			return;// 策划说不用加了 by 康露 2015年1月9日
/*			var sceneChar:SceneChar = Scene.scene.getSceneObjByID($enemyId, SceneCharType.PLAYER) as SceneChar;
			if (null == sceneChar)
			{
				return;
			}
			if(MainManager.isBanShuPass)
			{
				sceneChar.headFace.addTopDisplayIcon(new JieBiaoIcon(), EnumHeadFaceIconID.JIE_BIAO_ICON);
			}*/
		}
		
		/**
		 * 移除一个敌人 
		 * @param $enemyId 敌人id
		 * @author 康露 2015年1月4日
		 */
		public function delEnemy($enemyId:Number) : void
		{
			delete _dicEnemy[$enemyId];
			delFaceIcon($enemyId);			
		}
		
		public function delFaceIcon($enemyId:Number) : void
		{
/*			var sceneChar:SceneChar = Scene.scene.getSceneObjByID($enemyId, SceneCharType.PLAYER) as SceneChar;
			if (null == sceneChar)
			{
				return;
			}
			sceneChar.headFace.removeTopIconByID(EnumHeadFaceIconID.JIE_BIAO_ICON);*/
		}
		
		public function removeAllEnemy() : void
		{
			for (var enemyId:* in _dicEnemy)
			{
				delFaceIcon(Number(enemyId));
			}
			_dicEnemy = new Dictionary();
		}
		
		public function yunBiaoHelp() : void
		{
			_preShowHelpTime = SystemTimeManager.curtTm;
			YunBiaoSender.yunBiaoHelp();
		}
		
		override public function set isHited($value:Boolean) : void
		{
			super.isHited = $value;
			
			if ($value)
			{
				var now:Number = SystemTimeManager.curtTm;
				if ((now - _preShowHelpTime) >= (2 * TimeUtil.MINUTE_MICRO_SECONDS))
				{
					EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE,
						EnumFunctionMessageBarIcoType.GE_REN_YUN_BIAO_HELP);
				}
			} else
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
					EnumFunctionMessageBarIcoType.GE_REN_YUN_BIAO_HELP);
			}
		}
		
		override protected function onUpdateBiaoCheState() : void
		{
			EventManager.dispatchEvent(YunBiaoEvent.COUNTRY_UPDATE_BIAO_CHE_STATE);
		}
		
		override public function reset() : void
		{
			limitTime = 0;
			isFarAwar = false;
			removeAllEnemy();
			destoryFinishTimer();
		}
	}
}