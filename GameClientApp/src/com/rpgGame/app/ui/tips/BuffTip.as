package com.rpgGame.app.ui.tips
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.TextUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.info.buff.BuffData;
	
	import flash.utils.getTimer;
	
	import org.mokylin.skin.app.tips.Tips_BuffsSkin;

	/**
	 *
	 * Buff tips
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-06 下午2:53:32
	 *
	 */
	public class BuffTip extends SkinUI implements ITip
	{
		private static var _instance : BuffTip = null;

		public static function get instance() : BuffTip
		{
			if (!_instance)
			{
				_instance = new BuffTip();
			}
			return _instance;
		}

		private var _tipSkin : Tips_BuffsSkin;//BuffTipsSkin;
		private var _posy : int = 0;
		private var _timer:GameTimer;
		private var _endTime:Number;
		public function BuffTip()
		{
			_tipSkin = new Tips_BuffsSkin();
			super(_tipSkin);
			initTip();
		}

		private function initTip() : void
		{
			_timer=new GameTimer("BuffTip");
			_timer.onUpdate=onTimer;
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:Number=(_endTime-getTimer())/1000;
			if (left>0) 
			{
				_tipSkin.lbl_miaoshu2.text="剩余时间："+TextUtil.SecondToDHMS(left);;
			}
			else
			{
				_timer.stop();
			}
		}
		
		public function setTipData(data : *) : void
		{
			var buffData : BuffData = data.data;			
			_tipSkin.lbl_title.text=buffData.buffData.q_buff_name;
			var lostSkiLL:Q_lostskill_open = LostSkillData.getModeInfoById(buffData.buffData.q_buff_id);
			var desc:String="";
			if(lostSkiLL==null)
			{
				desc=buffData.buffData.q_description;
				if (buffData.buffData.q_tips_value_show!="") 
				{
					var arr:Array=JSONUtil.decode(buffData.buffData.q_tips_value_show);
					if (arr) 
					{
						var len:int=arr.length;
						for (var i:int = 0; i < len; i++) 
						{
							arr[i]=arr[i]*buffData.buffInfo.overlay;
						}
						desc=LanguageConfig.replaceStr(desc,arr);
					}
				}
			}
			else
			{
				var value1:int = 0;
				if(buffData.buffInfo.percent>0)
					value1 = buffData.buffInfo.percent;
				else
					value1 = buffData.buffInfo.value;
				desc=lostSkiLL.q_desc.replace("$",LostSkillManager.instance().getValueByType(lostSkiLL.q_type,value1))
			}
			_tipSkin.lbl_miaoshu1.htmlText=desc;
			_tipSkin.lbl_miaoshu2.y=_tipSkin.lbl_miaoshu1.y+_tipSkin.lbl_miaoshu1.textHeight+2;
			//var timeStr : String = buffData.disappearTime > 0 ? TimeUtil.timeFormatCH((buffData.disappearTime) * 0.001) : "永久";
			_tipSkin.lbl_miaoshu2.text="剩余时间：永久";
			_tipSkin.bg.height=_tipSkin.lbl_miaoshu2.y+_tipSkin.lbl_miaoshu2.height+10;
			if (buffData.disappearTime>0) 
			{
				_endTime=buffData.endTime;
				//_tipSkin.lbl_miaoshu2.text="剩余时间："+TextUtil.SecondToDHMS(buffData.disappearTime* 0.001);
				if (_timer.running==false) 
				{
					_timer.start();
				}
				onTimer();
			}
		}

		public function hideTips() : void
		{
			if (_timer&&_timer.running) 
			{
				_timer.stop();
			}
		}
	}
}
