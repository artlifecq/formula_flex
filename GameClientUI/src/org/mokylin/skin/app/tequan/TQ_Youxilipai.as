package org.mokylin.skin.app.tequan
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.tequan.button.ButtonLingqu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TQ_Youxilipai extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnOk:feathers.controls.Button;

		public var icon3:feathers.controls.UIAsset;

		public var labDown:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TQ_Youxilipai()
		{
			super();
			
			this.currentState = "normal";
			this.height = 498;
			this.width = 706;
			this.elementsContent = [bg_i(),btnOk_i(),labDown_i(),icon3_i(),__TQ_Youxilipai_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TQ_Youxilipai_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "温馨提示：每个角色只能被领取1次，领取时请勿解绑令牌";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 230;
			temp.y = 472;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/big_bg/tequan/linpai_bg.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.styleClass = org.mokylin.skin.app.tequan.button.ButtonLingqu;
			temp.x = 328;
			temp.y = 410;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 386;
			temp.y = 341;
			return temp;
		}

		private function labDown_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDown = temp;
			temp.name = "labDown";
			temp.text = "查看其他下载方法及FAQ介绍";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 327;
			temp.y = 308;
			return temp;
		}

	}
}