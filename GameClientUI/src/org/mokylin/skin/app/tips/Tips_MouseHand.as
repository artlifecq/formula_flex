package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_MouseHand extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lbl_miaoshu:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_MouseHand()
		{
			super();
			
			this.currentState = "normal";
			this.height = 38;
			this.width = 280;
			this.elementsContent = [bg_i(),lbl_miaoshu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 38;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaoshu = temp;
			temp.name = "lbl_miaoshu";
			temp.htmlText = "<font color='#a3a594'>当前经验：</font><font color='#eaeabc'>9999/10000000</font><font color='#00ff33'>(75%)</font>";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 256;
			temp.x = 10;
			temp.y = 10;
			return temp;
		}

	}
}