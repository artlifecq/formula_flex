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
		public var bg:feathers.controls.UIAsset;

		public var lable:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function npcTips2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 56;
			this.width = 199;
			this.elementsContent = [bg_i(),lable_i()];
			
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
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/tishi/qpb.png";
			temp.y = 0;
			return temp;
		}

		private function lable_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lable = temp;
			temp.name = "lable";
			temp.height = 32;
			temp.text = "你到时说话啊你到时说你到时说话啊你到时说你到时说话啊你到时说";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 186;
			temp.x = 6;
			temp.y = 9;
			return temp;
		}

	}
}