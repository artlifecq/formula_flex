package com.rpgGame.core.view.ui.tip.vo
{
	import com.rpgGame.coreData.info.face.BaseFaceInfo;

	public class SpellDynamicTipdata extends DynamicTipData
	{
		public function SpellDynamicTipdata(d:BaseFaceInfo):void
		{
			super(d);
		}
		
		/**
		 * 是否激活 
		 */
		public var isActivation:Boolean = false;
	}
}