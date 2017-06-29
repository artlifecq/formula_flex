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
	public class Tips_ShuXing extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lbl_miaoshu1:feathers.controls.Label;

		public var lbl_miaoshu2:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_ShuXing()
		{
			super();
			
			this.currentState = "normal";
			this.height = 79;
			this.width = 249;
			this.elementsContent = [bg_i(),lbl_title_i(),lbl_miaoshu1_i(),lbl_miaoshu2_i()];
			
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
			temp.height = 79;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 249;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_miaoshu1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaoshu1 = temp;
			temp.name = "lbl_miaoshu1";
			temp.height = 18;
			temp.text = "提高你的技能暴击时额外造成的伤害";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 229;
			temp.x = 10;
			temp.y = 30;
			return temp;
		}

		private function lbl_miaoshu2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaoshu2 = temp;
			temp.name = "lbl_miaoshu2";
			temp.height = 18;
			temp.text = "成长来源：荣耀系统、装备强化";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 229;
			temp.x = 10;
			temp.y = 50;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "【暴击伤害】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 213;
			temp.x = 4;
			temp.y = 10;
			return temp;
		}

	}
}