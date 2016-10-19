package com.rpgGame.app.manager.countryWar
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.MapPointSet;
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.coreData.cfg.ClientCountryWarChengMenCfgData;
	import com.rpgGame.coreData.cfg.ClientSceneEffectCfgData;
	import com.rpgGame.coreData.clientConfig.ClientSceneEffect;
	import com.rpgGame.coreData.clientConfig.CountryWarChengMenInfo;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarInfoData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	/**
	 * 国战城门管理
	 * GuoDong.Zhang
	 * 2016-8-25
	 */
	public class CountryWarChengMenManager
	{
		private static const sceneID:int = 7;
		private static var showed:Boolean;
		private static var _effecArr:Array;
		
		public static function checkChengMenStatus():void
		{
			if(!tryShowChengMen())
			{
				tryRemoveChengMen();
			}
		}
		
		public static function tryShowChengMen():Boolean
		{
			if(!showed)
			{
				var userData:HeroData = MainRoleManager.actorInfo;
				if(userData.mapID == sceneID)
				{
					var currentWarInfo:CountryWarInfoData = CountryWarManager.getCurrentWarInfo();
					if(currentWarInfo)
					{
						if(userData.sceneSequence == currentWarInfo.defenceCountry && CountryWarStatusManager.isChengMenGuardLive)
						{
							showChengMen();
							return true;
						}
					}
				}
			}
			return false;
		}
		
		public static function tryRemoveChengMen(defenceCountry:int = -1):void
		{
			if(showed)
			{
				showed = false;
				var userData:HeroData = MainRoleManager.actorInfo;
				if(userData.mapID == sceneID)
				{
					var doors:Array = ClientCountryWarChengMenCfgData.doorArr;
					if(doors)
					{
						var nameArr:Array = [];
						for each(var doorInfo:CountryWarChengMenInfo in doors)
						{
							var area:ClientMapAreaData = SceneManager.clientMapData.getDynamicObstacleArea(doorInfo.areaID);
							if(area)
							{
								nameArr.push("MapDataDynamicObstacleArea" + area.id);
							}
						}
						SceneManager.getScene().sceneMapLayer.removeObstaclePoints(nameArr);
					}
					if(userData.sceneSequence == defenceCountry)
					{
						playAllDoorsBreak();
					}
				}
				_effecArr = null;
			}
		}
		
		private static function createSceneEffect(effectData : ClientSceneEffect) : void
		{
			var bornPosArr : Array = effectData.bornPos.split(";");
			var len : int = bornPosArr.length;
			for (var i : int = 0; i < len; i++)
			{
				var xyArr : Array = String(bornPosArr[i]).split("=");
				var x : int = xyArr[0];
				var y : int = xyArr[1];
				var effect:RenderUnit3D = SceneRoleManager.getInstance().createSceneEffect(effectData, i + 1, SceneCharType.SCENE_EFFECT + "_" + effectData.id, x, y);
				if(effect)
				{
					effect.repeat = 1;
					effect.defalutStatus = RoleActionType.IDLE;
					effect.setStatus(RoleActionType.IDLE);
					effect.stop(0);
					if(_effecArr == null)
					{
						_effecArr = [];
					}
					_effecArr.push(effect);
				}
			}
		}
		
		private static function removeEffect(effect:RenderUnit3D):void
		{
			SceneManager.removeSceneObjFromScene(effect);
		}
		
		private static function playAllDoorsBreak():void
		{
			if(_effecArr)
			{
				for each(var effect:RenderUnit3D in _effecArr)
				{
					effect.setPlayCompleteCallBack(removeEffect);
					effect.setStatus(RoleActionType.DIE);
				}
				_effecArr = null;
			}
		}
		
		private static function showChengMen():void
		{
			if(!showed)
			{
				showed = true;
				var doors:Array = ClientCountryWarChengMenCfgData.doorArr;
				if(doors)
				{
					var mapPointSets : Vector.<MapPointSet> = new Vector.<MapPointSet>();
					for each(var doorInfo:CountryWarChengMenInfo in doors)
					{
						var area:ClientMapAreaData = SceneManager.clientMapData.getDynamicObstacleArea(doorInfo.areaID);
						if(area)
						{
							mapPointSets.push(new MapPointSet("MapDataDynamicObstacleArea" + area.id, area.getVector3Ds()));
						}
						var effectData : ClientSceneEffect = ClientSceneEffectCfgData.getData(doorInfo.effectID);
						var currMapId : int = MainRoleManager.actorInfo.mapID;
						if (effectData && effectData.sceneID == currMapId)
						{
							createSceneEffect(effectData);
						}
					}
					SceneManager.getScene().sceneMapLayer.addObstaclePoints(mapPointSets);
				}
			}
		}
		
		public static function testAddChengMen():void
		{
			var doors:Array = ClientCountryWarChengMenCfgData.doorArr;
			if(doors)
			{
				for each(var doorInfo:CountryWarChengMenInfo in doors)
				{
					var effectData : ClientSceneEffect = ClientSceneEffectCfgData.getData(doorInfo.effectID);
					var currMapId : int = MainRoleManager.actorInfo.mapID;
					if (effectData && effectData.sceneID == currMapId)
					{
						createSceneEffect(effectData);
					}
				}
			}
		}
		
		public static function testRemoveChengMen():void
		{
			if(_effecArr)
			{
				for each(var effect:RenderUnit3D in _effecArr)
				{
					effect.setPlayCompleteCallBack(removeEffect);
					effect.setStatus(RoleActionType.DIE);
				}
				_effecArr = null;
			}
		}
		
	}
}