package com.rpgGame.app.ui.main.openActivity
{
	import com.rpgGame.app.ui.main.openActivity.comps.ICampSub;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.coreData.utils.ActivityUtil;
	
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	
	/**
	 *活动右侧子面板基类 
	 * @author yfl
	 * 
	 */	
	public class BaseCampSubPanel extends SkinUI implements ICampSub
	{
		public function BaseCampSubPanel(skin:StateSkin=null)
		{
			super(skin);
		}
		
		public function setData(infos:Vector.<ActivityVo>):void
		{
			infos.sort(ActivityUtil.compareSort);
		}
		override protected function onHide():void
		{
			super.onHide();
			clearData();
		}
		public function clearData():void
		{
			throw new Error("BaseActivityListItemCell clearData must be override");
		}
	
		/**
		 * 设置按钮状态
		 * @param btn
		 * @param state 0已经领取，1可领取， 2不可领取
		 * 
		 */		
		public static function setBtnState(btn:Button,state:int,useText:Boolean=true):void
		{
			if (!btn) 
			{
				return;
			}
			//
			if (state==0) 
			{
				if (useText) 
				{
					btn.label="已领取";
				}
				TouchableUtil.gray(btn);
			}
			else if (state==1) 
			{
				if (useText) 
				{
					btn.label="可领取";
				}
				TouchableUtil.ungray(btn);
			}
			else if (state==2) 
			{
				if (useText) 
				{
					btn.label="未达成";
				}
				TouchableUtil.gray(btn);
			}
		}
	}
}