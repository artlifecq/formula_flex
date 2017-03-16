package org.mokylin.skin.mainui.head
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
	public class Head_small extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbl_name:feathers.controls.Label;

		public var lbl_num:feathers.controls.Label;

		public var xuetiao_zi:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_small()
		{
			super();
			
			this.currentState = "normal";
			this.height = 47;
			this.width = 217;
			this.elementsContent = [__Head_small_UIAsset1_i(),xuetiao_zi_i(),lbl_name_i(),lbl_num_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Head_small_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/small/1_yiji.png";
			temp.x = 0;
			temp.y = 20;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.height = 22;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "角色名六个字 (120级)";
			temp.textAlign = "center";
			temp.color = 0xC3C198;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 195;
			temp.x = 11;
			temp.y = 0;
			return temp;
		}

		private function lbl_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_num = temp;
			temp.name = "lbl_num";
			temp.text = "标签";
			temp.textAlign = "center";
			temp.width = 189;
			temp.x = 15;
			temp.y = 25;
			return temp;
		}

		private function xuetiao_zi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuetiao_zi = temp;
			temp.name = "xuetiao_zi";
			temp.styleName = "ui/mainui/head/small/hongse_1.png";
			temp.x = 13;
			temp.y = 25;
			return temp;
		}

	}
}