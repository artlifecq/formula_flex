package org.mokylin.skin.mainui.tishi
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
	public class paomadeng_Skin extends feathers.controls.StateSkin
	{
		public var lbl_msg:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function paomadeng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 26;
			this.width = 683;
			this.elementsContent = [__paomadeng_Skin_UIAsset1_i(),lbl_msg_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __paomadeng_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.styleName = "ui/mainui/tishi/paomateng.png";
			temp.width = 683;
			temp.y = 0;
			return temp;
		}

		private function lbl_msg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_msg = temp;
			temp.name = "lbl_msg";
			temp.bold = true;
			temp.text = "庆祝寻秦记测试，庆祝寻秦记测试，庆祝寻秦记测试";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 166;
			temp.y = 4;
			return temp;
		}

	}
}