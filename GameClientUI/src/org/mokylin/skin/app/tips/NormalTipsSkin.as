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
	public class NormalTipsSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lbl_miaoshu:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function NormalTipsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 85;
			this.width = 295;
			this.elementsContent = [bg_i(),lbl_miaoshu_i(),lbl_title_i()];
			
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
			temp.height = 85;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 295;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaoshu = temp;
			temp.name = "lbl_miaoshu";
			temp.height = 45;
			temp.text = "提高你的技能暴击时额外造成的伤害";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 282;
			temp.x = 7;
			temp.y = 29;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.fontSize = 16;
			temp.text = "标签";
			temp.width = 263;
			temp.x = 8;
			temp.y = 5;
			return temp;
		}

	}
}