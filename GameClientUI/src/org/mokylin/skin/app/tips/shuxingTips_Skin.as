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
	public class shuxingTips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbl_laiyuan:feathers.controls.Label;

		public var lbl_miaoshu:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function shuxingTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 85;
			this.width = 295;
			this.elementsContent = [__shuxingTips_Skin_UIAsset1_i(),lbl_name_i(),lbl_miaoshu_i(),lbl_laiyuan_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __shuxingTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 85;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 295;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_laiyuan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_laiyuan = temp;
			temp.name = "lbl_laiyuan";
			temp.height = 20;
			temp.text = "主要来源：荣耀系统，装备强化";
			temp.color = 0x2083B9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 235;
			temp.x = 11;
			temp.y = 57;
			return temp;
		}

		private function lbl_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaoshu = temp;
			temp.name = "lbl_miaoshu";
			temp.height = 20;
			temp.text = "提高你的技能暴击时额外造成的伤害";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 235;
			temp.x = 11;
			temp.y = 33;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = true;
			temp.height = 26;
			temp.fontSize = 16;
			temp.text = "暴击伤害";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 85;
			temp.x = 11;
			temp.y = 8;
			return temp;
		}

	}
}