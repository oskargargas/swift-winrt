// WARNING: Please don't edit this file. It was generated by Swift/WinRT v0.0.1
import Ctest_component

public typealias PropertyType = __x_ABI_CWindows_CFoundation_CPropertyType
public struct DateTime {
    public var UniversalTime: Int64 = 0
    public init() {}
    public init(UniversalTime: Int64) {
        self.UniversalTime = UniversalTime
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CDateTime) -> DateTime {
        .init(UniversalTime: abi.UniversalTime)
    }
}

public struct Point {
    public var X: Float = 0.0
    public var Y: Float = 0.0
    public init() {}
    public init(X: Float, Y: Float) {
        self.X = X
        self.Y = Y
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CPoint) -> Point {
        .init(X: abi.X, Y: abi.Y)
    }
}

public struct Rect {
    public var X: Float = 0.0
    public var Y: Float = 0.0
    public var Width: Float = 0.0
    public var Height: Float = 0.0
    public init() {}
    public init(X: Float, Y: Float, Width: Float, Height: Float) {
        self.X = X
        self.Y = Y
        self.Width = Width
        self.Height = Height
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CRect) -> Rect {
        .init(X: abi.X, Y: abi.Y, Width: abi.Width, Height: abi.Height)
    }
}

public struct Size {
    public var Width: Float = 0.0
    public var Height: Float = 0.0
    public init() {}
    public init(Width: Float, Height: Float) {
        self.Width = Width
        self.Height = Height
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CSize) -> Size {
        .init(Width: abi.Width, Height: abi.Height)
    }
}

public struct TimeSpan {
    public var Duration: Int64 = 0
    public init() {}
    public init(Duration: Int64) {
        self.Duration = Duration
    }
    public static func from(abi: __x_ABI_CWindows_CFoundation_CTimeSpan) -> TimeSpan {
        .init(Duration: abi.Duration)
    }
}

public protocol IPropertyValue : IWinRTObject { 
        func GetUInt8() -> UInt8 
        func GetInt16() -> Int16 
        func GetUInt16() -> UInt16 
        func GetInt32() -> Int32 
        func GetUInt32() -> UInt32 
        func GetInt64() -> Int64 
        func GetUInt64() -> UInt64 
        func GetSingle() -> Float 
        func GetDouble() -> Double 
        func GetChar16() -> Character 
        func GetBoolean() -> Bool 
        func GetString() -> String 
        func GetGuid() -> UUID 
        func GetDateTime() -> test_component.DateTime 
        func GetTimeSpan() -> test_component.TimeSpan 
        func GetPoint() -> test_component.Point 
        func GetSize() -> test_component.Size 
        func GetRect() -> test_component.Rect 
        var IsNumericScalar: Bool { get }
        var `Type`: test_component.PropertyType { get }
}
public protocol IReference : IPropertyValue {
    var Value: Any { get }
}
extension test_component.PropertyType {
    public static var Empty : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Empty
    }
    public static var UInt8 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt8
    }
    public static var Int16 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int16
    }
    public static var UInt16 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt16
    }
    public static var Int32 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int32
    }
    public static var UInt32 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt32
    }
    public static var Int64 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int64
    }
    public static var UInt64 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt64
    }
    public static var Single : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Single
    }
    public static var Double : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Double
    }
    public static var Char16 : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Char16
    }
    public static var Boolean : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Boolean
    }
    public static var String : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_String
    }
    public static var Inspectable : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Inspectable
    }
    public static var DateTime : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_DateTime
    }
    public static var TimeSpan : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_TimeSpan
    }
    public static var Guid : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Guid
    }
    public static var Point : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Point
    }
    public static var Size : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Size
    }
    public static var Rect : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Rect
    }
    public static var OtherType : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_OtherType
    }
    public static var UInt8Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt8Array
    }
    public static var Int16Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int16Array
    }
    public static var UInt16Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt16Array
    }
    public static var Int32Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int32Array
    }
    public static var UInt32Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt32Array
    }
    public static var Int64Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Int64Array
    }
    public static var UInt64Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_UInt64Array
    }
    public static var SingleArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_SingleArray
    }
    public static var DoubleArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_DoubleArray
    }
    public static var Char16Array : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_Char16Array
    }
    public static var BooleanArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_BooleanArray
    }
    public static var StringArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_StringArray
    }
    public static var InspectableArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_InspectableArray
    }
    public static var DateTimeArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_DateTimeArray
    }
    public static var TimeSpanArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_TimeSpanArray
    }
    public static var GuidArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_GuidArray
    }
    public static var PointArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_PointArray
    }
    public static var SizeArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_SizeArray
    }
    public static var RectArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_RectArray
    }
    public static var OtherTypeArray : test_component.PropertyType {
        __x_ABI_CWindows_CFoundation_CPropertyType_OtherTypeArray
    }
}
