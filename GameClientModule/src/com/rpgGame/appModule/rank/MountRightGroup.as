package com.rpgGame.appModule.rank
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.state.role.action.PlayActionStateReference;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.SpellDynamicTipdata;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.netData.horse.bean.HorseDataInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	
	import starling.display.DisplayObjectContainer;
	
	public class MountRightGroup extends RightGroupBase
	{
		private var _modeData:Q_horse;
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
			this._scale = 1.0;
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
			if(_roleData==null)
			{
				_roleData = new RoleData(0);
			}
			var current:Q_horse = _showdata.housedata;
			_roleData.avatarInfo.setBodyResID(current.q_skinResID,current.q_animatResID);
		}
		
		override protected function refeashModle():void
		{
			super.refeashModle();
			_avatar.transition(RoleStateType.ACTION_SHOW);
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
		
		
		private function updateTime():void
		{
			_avatar.transition(RoleStateType.ACTION_SHOW);
		}
		
	}
}