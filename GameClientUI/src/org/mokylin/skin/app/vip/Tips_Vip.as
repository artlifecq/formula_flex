package org.mokylin.skin.app.vip
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
	public class Tips_Vip extends feathers.controls.StateSkin
	{
		public var imgBG:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_Vip()
		{
			super();
			
			this.currentState = "normal";
			this.height = 110;
			this.width = 206;
			this.elementsContent = [imgBG_i(),__Tips_Vip_Label1_i(),__Tips_Vip_UIAsset1_i(),__Tips_Vip_Label2_i(),__Tips_Vip_Label3_i(),__Tips_Vip_Label4_i(),__Tips_Vip_Label5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_Vip_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "墨者令";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreeni"];
			temp.width = 102;
			temp.x = 12;
			temp.y = 11;
			return temp;
		}

		private function __Tips_Vip_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "增强属性：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 13;
			temp.y = 60;
			return temp;
		}

		private function __Tips_Vip_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "获得路径：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 13;
			temp.y = 79;
			return temp;
		}

		private function __Tips_Vip_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "生命、攻击、防御";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 78;
			temp.y = 60;
			return temp;
		}

		private function __Tips_Vip_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "购买VIP自动佩戴";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 78;
			temp.y = 79;
			return temp;
		}

		private function __Tips_Vip_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/pdzqsx.png";
			temp.x = 13;
			temp.y = 41;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 110;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 206;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}