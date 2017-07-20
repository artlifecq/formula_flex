package com.rpgGame.appModule.rank
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.SpellDynamicTipdata;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.netData.horse.bean.HorseDataInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	
	import starling.display.DisplayObjectContainer;
	
	public class MountRightGroup extends RightGroupBase
	{
		private var _modeData:Q_horse;
		private var _curtentInter3D:InterObject3D;
		public function MountRightGroup(skin:PaiHang_Right, type:int)
		{
			super(skin, type);
		}
		private var _showdata:MountShowData;
		private var _horsedataInfo:HorseDataInfo;
		private var _currentUnit:RenderUnit3D;
		private var _spellIconList:Vector.<IconCDFace>;
		
		override protected function initView():void
		{
			super.initView();
			_spellIconList = new Vector.<IconCDFace>();
			
			var partner:DisplayObjectContainer = _skin.icon1.parent;
			var spellList:Vector.<BaseFaceInfo> = HorseManager.instance().spellList; 
			var icon:IconCDFace = IconCDFace.create(IcoSizeEnum.ICON_42);
			icon.bindBg(_skin.icon1);
			FaceUtil.SetSkillGrid(icon, spellList[0], true);
			partner.addChild(icon);
			_spellIconList.push(icon);
			
			icon = IconCDFace.create(IcoSizeEnum.ICON_42);
			icon.bindBg(_skin.icon2);
			FaceUtil.SetSkillGrid(icon, spellList[1], true);
			partner.addChild(icon);
			_spellIconList.push(icon);
			
			icon = IconCDFace.create(IcoSizeEnum.ICON_42);
			icon.bindBg(_skin.icon3);
			FaceUtil.SetSkillGrid(icon, spellList[2], true);
			partner.addChild(icon);
			_spellIconList.push(icon);
			
		}
		override protected function initData():void
		{
			if(_showdata==null)
			{
				_showdata = new MountShowData();
				_showdata.useExtraItem(0,0);
				_horsedataInfo = new HorseDataInfo();
			}
			_horsedataInfo.horseModelId = _topInfo.playerBriefInfo.horseModelid;
			_showdata.heroJob = _topInfo.job;
			_showdata.horsedataInfo = _horsedataInfo;
			var props:Vector.<Number> =  _showdata.currentProp(null);
			_power = FightValueUtil.calAtrributeFightPower(props,_showdata.heroJob);
		}
		
		override protected function refeashModle():void
		{
			if(_curtentInter3D!=null)
			{
				this._modleContent.removeChild3D(_curtentInter3D,true);
				_curtentInter3D = null;
			}
			
			var current:Q_horse = _showdata.housedata;
			_curtentInter3D = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "mount1",ClientConfig.getAvatar(current.q_skinResID));
			data.animatorSourchPath = ClientConfig.getAvatar( current.q_animatResID);
			data.forceLoad=true;//ui上的3d特效强制加载
			_currentUnit = addRenderUnitWith(data,_curtentInter3D);
			_curtentInter3D.x = _skin.weapons.x + (_skin.weapons.width >> 1);
			_curtentInter3D.y = _skin.weapons.y + _skin.weapons.height+20;
			_curtentInter3D.rotationY = 60;
//			_currentUnit.setScale(1.8);
			_currentUnit.addUnitAtComposite(_currentUnit);
			this._modleContent.addChild3D(_curtentInter3D);
			showModeSate(RoleActionType.SHOW_IDLE);
		}
		
		override protected function refeashName():void
		{
			_skin.grpHead.visible = true;
			_skin.lbName.visible = false;
			_skin.headName.styleName = "ui/app/paihangbang/word/zuoqi/"+_showdata.housedata.q_id.toString()+".png"
		}
		
		override protected function refeashEquip():void
		{
			_skin.weapons.visible = false;
		}
		
		override protected function refeashSkill():void
		{
			_skin.grpKillIcon.visible = true;
			var spellList:Vector.<BaseFaceInfo> = HorseManager.instance().spellList;
			var length:int = spellList.length;
			for(var i:int = 0;i<length;i++)
			{
				var icon:IconCDFace = _spellIconList[i];
				var isActivation:Boolean = false;
				if(checkHaveSkill(spellList[i].cfgId))
				{
					icon.filter=null;
					isActivation = true;
				}else{
					if(icon.filter==null)
					{
						GrayFilter.gray(icon);
					}
				}
				var data:SpellDynamicTipdata = TipTargetManager.getTiipsByTarget(icon) as SpellDynamicTipdata;
				if(data!=null)
				{
					data.isActivation = isActivation;
				}
			}
		}
		
		private function checkHaveSkill(id:int):Boolean
		{
			var length:int = _topInfo.playerBriefInfo.horseSkillInfos.length;
			for(var i:int = 0;i<length;i++)
			{
				if(_topInfo.playerBriefInfo.horseSkillInfos[i].skillModelId == id)
				{
					return true;
				}
			}
			return false;
		}
		
		private function addRenderUnitWith(rend : RenderParamData3D,src3d:InterObject3D):RenderUnit3D
		{
			var unit : RenderUnit3D;
			unit = RenderUnit3D.create(rend);
			unit.repeat = 1;
			unit.setPlayCompleteCallBack(onPlayComplete, src3d);
			unit.setAddedCallBack(addComplete);
			src3d.setRenderUnit(unit);
			return unit;
		}
		private function addComplete(unit : RenderUnit3D):void
		{
			showModeSate(RoleActionType.SHOW_IDLE);
		}
		
		private function updateTime():void
		{
			showModeSate(RoleActionType.SHOW_IDLE);
		}
		private function onPlayComplete(iter3d:InterObject3D,unit : RenderUnit3D ):void
		{
			showModeSate(RoleActionType.STAND);
		}
		
		private function showModeSate(state:String):void
		{
			if(_currentUnit==null)
				return ;
			_currentUnit.setStatus(state);
		}
	}
}