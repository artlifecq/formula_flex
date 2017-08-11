package com.rpgGame.appModule.skill
{
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.SpellManager;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import feathers.controls.Label;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.wuxue.jineng.jinengItemsSkin;
	
	import starling.display.DisplayObject;
	
	/**
	 *技能描述元素 
	 * @author dik
	 * 
	 */
	public class SkillItem extends SkinUI
	{
		private var _skin:jinengItemsSkin;
		private var _skillInfo:SkillInfo;
		private var _skillCfg:Q_skill_model;
		//		private var _selected:Boolean;
		private var _icon:BgIcon;
		
		private var eft:InterObject3D;
		
		public function SkillItem()
		{
			_skin=new jinengItemsSkin();
			//			selected=false;
			_skin.imgSelect.visible=false;
			super(_skin);
			_icon=new BgIcon(IcoSizeEnum.ICON_42);		
			_skin.container.addChild(_icon);
			_icon.bindBg(_skin.Icon);
			_icon.touchable=false;
			MCUtil.BringToTop(_skin.mc_dengjie);
			MCUtil.removeSelf(_skin.txt_Acitve);
			MCUtil.removeSelf(_skin.txt_xianzhi);
		}
		
		
		public function get skillCfg():Q_skill_model
		{
			return _skillCfg;
		}
		
		public function get skillInfo():SkillInfo
		{
			return _skillInfo;
		}
		
		public function updateItem(cfg:Q_skill_model,info:SkillInfo=null):void
		{
			_skin.txt_Name.text=cfg.q_skillName;
			_skillCfg=cfg;
			_skillInfo=info;
			_skin.tips.visible=SpellManager.canUpOrRise(cfg.q_skillID)>0;
			var i:int=0;
			_icon.setIconResName(ClientConfig.getSkillIcon(cfg.q_skillID.toString(),IcoSizeEnum.ICON_42));
//			trace("技能ID："+cfg.q_skillID);
			var item:DisplayObject;
			var riseCfg:Q_skill_model=info?SpellDataManager.getSpellData(cfg.q_skillID,info.skillLevel+1):null;
			if(info){//学习了的技能
				_skin.txt_level.visible=true;
				while(i<_skin.container.numChildren){
					item=_skin.container.getChildAt(i);
					i++;					
					if(item is Label){
						continue;
					}else{
						GrayFilter.unGray(item);
					}
				}
				this.touchable=true;
				_skin.txt_level.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT1)+info.skillChildLv+"/"+cfg.q_max_level;
				if(info.skillLevel==1){
					_skin.txt_Inacitve.color=StaticValue.A_UI_GRAY_TEXT;
					_skin.mc_dengjie.visible=true;
					if(info.skillLevel==cfg.q_max_grade){
						_skin.mc_dengjie.visible=false;
					}
					if(!riseCfg){
						_skin.txt_Inacitve.text="";
					}else{
						_skin.txt_Inacitve.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT2);
					}
				}else{
					_skin.txt_Inacitve.color=StaticValue.A_UI_YELLOW_TEXT;
					_skin.txt_Inacitve.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT3);
				}
				_skin.mc_dengjie.gotoAndStop(info.skillLevel.toString());//阶数
			}else{
				while(i<_skin.container.numChildren){
					item=_skin.container.getChildAt(i);
					i++;					
					if(item is Label){
						continue;
					}else{
						GrayFilter.gray(item);
					}
				}
				this.touchable=false;
				
				_skin.txt_level.visible=false;
				_skin.txt_Inacitve.color=StaticValue.A_UI_GRAY_TEXT;
				_skin.mc_dengjie.visible=true;
				if(!riseCfg){
					_skin.txt_Inacitve.text=cfg.q_show_needgrade+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT16);
				}
				
				if(cfg.q_max_grade==1){
					_skin.mc_dengjie.visible=false;
				}
				_skin.mc_dengjie.gotoAndStop("1");//阶数
			}
			
			TipTargetManager.remove(this);
			TipTargetManager.show( this, TargetTipsMaker.makeTips( TipType.SPELL_TIP, cfg.q_skillID));
		}
		
		public function set selected(value:Boolean):void
		{
			_skin.imgSelect.visible=value;
			//			_selected=value;
			//			if(value){
			//				eft=this.playInter3DAt(ClientConfig.getEffect("ui_zhuanquan"),120,30,0);
			//			}else{
			//				if(eft){
			//					eft.stop();
			//					eft.removeFromParent(true);
			//				}
			//			}
		}
		
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			EventManager.dispatchEvent(SpellEvent.SELECTE_SPELL,this);
		}
	}
}