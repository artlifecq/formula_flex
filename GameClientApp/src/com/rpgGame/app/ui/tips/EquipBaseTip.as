package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	
	import feathers.controls.Label;
	
	import org.mokylin.skin.app.tips.EquipTipsSkin;
	
	public class EquipBaseTip extends SkinUI
	{
		private var spriteStatVector : Vector.<EquipStatItem>;
		private var skin : Object;//EquipTipsSkin;
		public function EquipBaseTip()
		{
			spriteStatVector = new Vector.<EquipStatItem>();
//			skin = new EquipTipsSkin();
			super(skin);
		}
		
//		public function showData(equip:EquipInfo):void
//		{
//			if(!equip)
//				return;
//			skin.labName.text = ItemQualityType.getHtmlEquipQualityEvaluteName(equip.refined_times,equip.quality,equip.name,equip.evaluate);
//			skin.isBind.text = equip.binded?"已绑定":equip.isEquipBind?"装备绑定":"未绑定";
//			if(equip.base_stat)
//			{
//				equip.baseSpriteStat
//			}
//		}
		
		
		/**
		 * 设置属性行Y坐标 
		 * @param label
		 * @param index
		 * 
		 */		
		private function setSpriteStatLabelY(label:Label,index:int):void
		{
			
		}
		
	}
}