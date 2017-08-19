package org.mokylin.skin.app.shejiao.zudui
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
	public class DuiWu_Tips extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBG:feathers.controls.UIAsset;

		public var lb_name:feathers.controls.Label;

		public var lbl_laiyuan:feathers.controls.Label;

		public var lbl_miaoshu:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuiWu_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 163;
			this.width = 281;
			this.elementsContent = [imgBG_i(),lb_name_i(),__DuiWu_Tips_Label1_i(),lbl_miaoshu_i(),lbl_laiyuan_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DuiWu_Tips_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 26;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "【等级】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 63;
			temp.x = 215;
			temp.y = 11;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 166;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 281;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "【队员名称】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 131;
			temp.x = 5;
			temp.y = 11;
			return temp;
		}

		private function lbl_laiyuan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_laiyuan = temp;
			temp.name = "lbl_laiyuan";
			temp.height = 20;
			temp.text = "66";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 220;
			temp.y = 32;
			return temp;
		}

		private function lbl_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaoshu = temp;
			temp.name = "lbl_miaoshu";
			temp.height = 20;
			temp.text = "玩家名称6个字";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 145;
			temp.x = 11;
			temp.y = 32;
			return temp;
		}

	}
}