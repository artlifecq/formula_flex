package org.mokylin.skin.app.npc
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
	public class npcTips2_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var lable:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function npcTips2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 103;
			this.width = 196;
			this.elementsContent = [bg2_i(),bg1_i(),lable_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg1 = temp;
			temp.name = "bg1";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/tishi/qpb.png";
			temp.top = 0;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.height = 103;
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/tishi/qpb.png";
			temp.visible = false;
			temp.width = 196;
			temp.x = 196;
			temp.y = 0;
			return temp;
		}

		private function lable_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lable = temp;
			temp.name = "lable";
			temp.height = 21;
			temp.leading = 2;
			temp.text = "你到时说话啊";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 164;
			temp.x = 22;
			temp.y = 31;
			return temp;
		}

	}
}