package com.rpgGame.appModule.rank
{
	import com.rpgGame.coreData.enum.RankListType;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Jieshu;
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	import org.mokylin.skin.common.Flip1_Skin;
	
	public class BeautyListView extends RankListViewBase
	{
		private var _skin:PaiHang_Jieshu;
		public function BeautyListView():void
		{
			_skin = new PaiHang_Jieshu();
			super(_skin, RankListType.BEAUTY_TYPE);
		}
		
		override protected function initstance():void
		{
			this._cellGroup = _skin.cellgroup;
			this.bindBtnAll(_skin.btnAll);
			this.bindPageBtn(_skin.skinFlip.skin as Flip1_Skin);
			this.bindRightGroup(_skin.skinRight);
			this._uiTongjizhong = _skin.uiTongjizhong;
			super.initstance();
		}
		
		
		override protected function bindRightGroup(content:SkinnableContainer):void
		{
			if(_rightGroup!=null)
				return ;
			_rightGroup = new BeautyRightGroup(content.skin as PaiHang_Right,_type);
		}
	}
}
import com.rpgGame.app.manager.Mgr;
import com.rpgGame.app.utils.FaceUtil;
import com.rpgGame.app.utils.FightValueUtil;
import com.rpgGame.app.view.icon.IconCDFace;
import com.rpgGame.appModule.rank.RightGroupBase;
import com.rpgGame.coreData.cfg.AttValueConfig;
import com.rpgGame.coreData.cfg.PetAdvanceCfg;
import com.rpgGame.coreData.cfg.SpellDataManager;
import com.rpgGame.coreData.clientConfig.Q_att_values;
import com.rpgGame.coreData.clientConfig.Q_girl_advance;
import com.rpgGame.coreData.clientConfig.Q_skill_model;
import com.rpgGame.coreData.enum.item.IcoSizeEnum;
import com.rpgGame.coreData.role.RoleData;
import com.rpgGame.coreData.type.RoleStateType;
import com.rpgGame.netData.skill.bean.SkillInfo;

import org.mokylin.skin.app.paihangbang.PaiHang_Right;

import starling.display.DisplayObjectContainer;


class BeautyRightGroup extends RightGroupBase
{
	private var _girlData:Q_girl_advance;
	private var _spellIconList:Vector.<IconCDFace>;
	public function BeautyRightGroup(skin:PaiHang_Right, type:int)
	{
		super(skin, type);
	}
	override protected function initView():void
	{
		this._scale = 2;
		super.initView();	
		_spellIconList = new Vector.<IconCDFace>();
		
		var partner:DisplayObjectContainer = _skin.icon1.parent;
		var icon:IconCDFace = IconCDFace.create(IcoSizeEnum.ICON_42);
		icon.bindBg(_skin.icon1);
		partner.addChild(icon);
		_spellIconList.push(icon);
		
		icon = IconCDFace.create(IcoSizeEnum.ICON_42);
		icon.bindBg(_skin.icon2);
		partner.addChild(icon);
		_spellIconList.push(icon);
		
		icon = IconCDFace.create(IcoSizeEnum.ICON_42);
		icon.bindBg(_skin.icon3);
		partner.addChild(icon);
		_spellIconList.push(icon);
		
		icon = IconCDFace.create(IcoSizeEnum.ICON_42);
		icon.bindBg(_skin.icon4);
		partner.addChild(icon);
		_spellIconList.push(icon);
		
		icon = IconCDFace.create(IcoSizeEnum.ICON_42);
		icon.bindBg(_skin.icon5);
		partner.addChild(icon);
		_spellIconList.push(icon);
		
		icon = IconCDFace.create(IcoSizeEnum.ICON_42);
		icon.bindBg(_skin.icon6);
		partner.addChild(icon);
		_spellIconList.push(icon);
	}
	override protected function initData():void
	{
		_girlData = PetAdvanceCfg.getPet(_topInfo.playerBriefInfo.beautyModelid,_topInfo.param);
		if(_girlData!=null)
		{
			var attId:int=Mgr.petMgr.getAttId(_girlData.q_attid_master);
			var attValues1:Q_att_values=AttValueConfig.getAttInfoById(attId);
			_power = FightValueUtil.calFightPowerByAttValue(attValues1,_topInfo.job);
			_avatar.updateBodyWithRes(_girlData.q_skinResID,_girlData.q_animatResID);
		}else{
			_power = 0;
			_avatar.dispose();
		}
	}
	
	override protected function refeashJunjie():void
	{
		
	}
	
	override protected function refeashModle():void
	{
		//			super.refeashModle();
		if(_avatar){
			_avatar.transition(RoleStateType.ACTION_SHOW);
		}
	}
	
	override protected function refeashEquip():void
	{
		_skin.weapons.visible = false;
	}
	
	override protected function refeashSkill():void
	{
		_skin.grpKillIcon.visible = true;
		var length:int = _spellIconList.length;
		for(var i:int = 0;i<length;i++)
		{
			_spellIconList[i].clear();
		}
		if(_girlData){
			var skill:Q_skill_model=SpellDataManager.getSpellById(_girlData.q_skill_id);			
			length = 1;
			var skillinfo:SkillInfo;
			for(i=0;i<length;i++)
			{
				FaceUtil.SetSkillGrid(_spellIconList[i], FaceUtil.chanceSpellToFaceInfo(skill), true);
			}
		}
	}
	
	override protected function refeashName():void
	{
		if(_girlData)
		{
			_skin.grpHead.visible = true;
			_skin.lbName.visible = false;
			_skin.headName.styleName = "ui/app/paihangbang/word/meiren/"+_topInfo.playerBriefInfo.beautyModelid.toString()+".png";
		}
		else{
			_skin.grpHead.visible = false;
		}
	}
	
	private function updateTime():void
	{
		if(_avatar){
			_avatar.transition(RoleStateType.ACTION_SHOW);
		}
	}
}