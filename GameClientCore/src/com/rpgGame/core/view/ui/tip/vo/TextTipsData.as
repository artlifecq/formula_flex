package com.rpgGame.core.view.ui.tip.vo
{
	import com.rpgGame.coreData.cfg.LanguageConfig;

	/**
	 * 文本TIPS的数据类
	 * @author luguozheng
	 *
	 */
	public class TextTipsData
	{
		private var _info : String;
		private var _dynamicData : Array;
		private var _dynamicFun : Function;

		/**
		 * 文本TIPS的数据
		 * 优先级：动态文本，静态带参数文本，普通文本
		 * @param info				文字描述
		 * @param _dynamicData		带参数的静态文本的参数	（这个可以直接用把文本拼好用普通文本。)
		 * @param dynamicFunc		带参数的动态文本的方法，此方法一定是会返回数组，数组中带着参数
		 *
		 */
		public function TextTipsData(info : String, dynamicData : Array = null, dynamicFunc : Function = null)
		{
			_info = info;
			_dynamicData = dynamicData;
			_dynamicFun = dynamicFunc;
		}

		/**
		 * 得到最终的文本
		 * @return
		 *
		 */
		public function getTipsInfo() : String
		{
			if (_dynamicFun != null)
			{
				var dynamicDataArr : Array = _dynamicFun();
				return LanguageConfig.replaceStr(_info, dynamicDataArr);
			}

			if (_dynamicData != null)
				return LanguageConfig.replaceStr(_info, _dynamicData);

			return _info;
		}

		public function set info(value : String) : void
		{
			_info = value;
		}
	}
}
