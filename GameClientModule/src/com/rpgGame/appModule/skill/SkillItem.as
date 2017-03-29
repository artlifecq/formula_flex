package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.wuxue.jineng.jinengItemsSkin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
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
		private var _selected:Boolean;
		private var _icon:BgIcon;
		
		public function SkillItem()
		{
			_skin=new jinengItemsSkin();
			selected=false;
			_icon=new BgIcon(IcoSizeEnum.ICON_48);
			_icon.touchable=false;
			super(_skin);
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
			_skin.tips.visible=false;
			var i:int=0;
			if(info){//学习了的技能
				_skin.txt_level.visible=true;
				while(i<_skin.container.numChildren){
					GrayFilter.unGray(_skin.container.getChildAt(i));
					i++;					
				}
				this.touchable=true;
				_skin.txt_level.text="等级:"+info.skillLevel+"/"+cfg.q_max_level;
				if(info.skillLevel==1){
					_skin.txt_Inacitve.color=0x8b8d7b;
					_skin.txt_Inacitve.text="未激活进阶效果";
				}else{
					_skin.txt_Inacitve.color=0xc9b722;
					_skin.txt_Inacitve.text="已激活进阶效果";
				}
				_skin.mc_dengjie.gotoAndStop(info.skillLevel.toString());//阶数
			}else{
				while(i<_skin.container.numChildren){
					GrayFilter.gray(_skin.container.getChildAt(i));
					i++;					
				}
				this.touchable=false;
				
				_skin.txt_level.visible=false;
				_skin.txt_Inacitve.color=0x8b8d7b;
				_skin.txt_Inacitve.text=cfg.q_show_needgrade+"级自动获得";
			}
			
			_icon.setIconResName(ClientConfig.getSkillIcon(cfg.q_skillID.toString(),48));
			_skin.container.addChildAt(_icon,9);
			
			TipTargetManager.remove(this);
			TipTargetManager.show( this, TargetTipsMaker.makeTips( TipType.SPELL_TIP, cfg.q_skillID));
		}
		
		override protected function onTouch(e:TouchEvent):void
		{
			super.onTouch(e);
			if(_selected){
				return;
			}
			var t:Touch=e.getTouch(_skin.select_btn);
			if(!t){
				_skin.select_btn.alpha=0;
			}
			t=e.getTouch(_skin.select_btn,TouchPhase.HOVER);
			if(t){
				_skin.select_btn.alpha=0.5;
			}
		}
		
		public function set selected(value:Boolean):void
		{
			_selected=value;
			if(value){
				_skin.select_btn.alpha=1;
			}else{
				_skin.select_btn.alpha=0;
			}
		}
			
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			EventManager.dispatchEvent(SpellEvent.SELECTE_SPELL,this);
		}
	}
}