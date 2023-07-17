// WARNING: Please don't edit this file. It was generated by Swift/WinRT v0.0.1
import Ctest_component

public enum __IMPL_test_component {
    public class IBasicImpl : IBasic, WinRTAbiBridge {
        public typealias CABI = __x_ABI_Ctest__component_CIBasic
        public typealias SwiftABI = __ABI_test_component.IBasic
        public typealias SwiftProjection = AnyIBasic
        private (set) public var _default: SwiftABI
        public var thisPtr: test_component.IInspectable { _default }
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IBasicImpl(abi)
        }
        public init(_ fromAbi: UnsafeMutablePointer<CABI>) {
            _default = SwiftABI(fromAbi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.IBasicVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
        public func method() throws {
            try _default.MethodImpl()
        }

    }

    public class IIAmImplementableImpl : IIAmImplementable, WinRTAbiBridge {
        public typealias CABI = __x_ABI_Ctest__component_CIIAmImplementable
        public typealias SwiftABI = __ABI_test_component.IIAmImplementable
        public typealias SwiftProjection = AnyIIAmImplementable
        private (set) public var _default: SwiftABI
        public var thisPtr: test_component.IInspectable { _default }
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IIAmImplementableImpl(abi)
        }
        public init(_ fromAbi: UnsafeMutablePointer<CABI>) {
            _default = SwiftABI(fromAbi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.IIAmImplementableVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
        public func inInt32(_ value: Int32) throws -> String {
            let result = try _default.InInt32Impl(value)
            return .init(from: result)
        }

        public func inString(_ value: String) throws -> String {
            let _value = try! HString(value)
            let result = try _default.InStringImpl(_value.get())
            return .init(from: result)
        }

        public func inObject(_ value: Any!) throws -> String {
            let valueWrapper = __ABI_.AnyWrapper(value)
            let _value = try! valueWrapper?.toABI { $0 }
            let result = try _default.InObjectImpl(_value)
            return .init(from: result)
        }

        public func inEnum(_ value: Signed) throws -> String {
            let result = try _default.InEnumImpl(value)
            return .init(from: result)
        }

        public func outInt32(_ value: inout Int32) throws {
            try _default.OutInt32Impl(&value)
        }

        public func outString(_ value: inout String) throws {
            var _value: HSTRING?
            try _default.OutStringImpl(&_value)
            value = .init(from: _value)
            WindowsDeleteString(_value)
        }

        public func outObject(_ value: inout Any!) throws {
            var _value: UnsafeMutablePointer<Ctest_component.IInspectable>?
            try _default.OutObjectImpl(&_value)
            value = __ABI_.AnyWrapper.unwrapFrom(abi: _value)
        }

        public func outBlittableStruct(_ value: inout BlittableStruct) throws {
            var _value: __x_ABI_Ctest__component_CBlittableStruct = .init()
            try _default.OutBlittableStructImpl(&_value)
            value = .from(abi: _value)
        }

        public func outNonBlittableStruct(_ value: inout NonBlittableStruct) throws {
            let _value: __ABI_test_component._ABI_NonBlittableStruct = .init()
            try _default.OutNonBlittableStructImpl(&_value.val)
            value = .from(abi: _value.val)
        }

        public func outEnum(_ value: inout Signed) throws {
            try _default.OutEnumImpl(&value)
        }

        public func returnObject() throws -> Any! {
            let result = try _default.ReturnObjectImpl()
            return __ABI_.AnyWrapper.unwrapFrom(abi: result)
        }

        public func returnEnum() throws -> Signed {
            let result = try _default.ReturnEnumImpl()
            return result
        }

        public func fireEvent(_ data: String) throws {
            let _data = try! HString(data)
            try _default.FireEventImpl(_data.get())
        }

        public var enumProperty : Fruit {
            get {
                let value = try! _default.get_EnumPropertyImpl()
                return value
            }

            set {
                try! _default.put_EnumPropertyImpl(newValue)
            }
        }

        public var id : UUID? {
            get {
                let value = try! _default.get_IdImpl()
                return .init(ref: value)
            }

            set {
                let wrapper = test_component.__x_ABI_C__FIReference_1_GUIDWrapper(newValue)
                let _newValue = try! wrapper?.toABI { $0 }
                try! _default.put_IdImpl(_newValue)
            }
        }

        public lazy var implementableEvent : Event<test_component.InDelegate> = {
          .init(
            add: { [weak this = _default] in
              guard let this else { return .init() }
              let wrapper = __ABI_test_component_Delegates.InDelegateWrapper($0)
              let abi = try! wrapper?.toABI { $0 }
              return try! this.add_ImplementableEventImpl(abi)
            },
            remove: { [weak this = _default] in
             try? this?.remove_ImplementableEventImpl($0) 
           }
          )
        }()

    }

    public class ISimpleDelegateImpl : ISimpleDelegate, WinRTAbiBridge {
        public typealias CABI = __x_ABI_Ctest__component_CISimpleDelegate
        public typealias SwiftABI = __ABI_test_component.ISimpleDelegate
        public typealias SwiftProjection = AnyISimpleDelegate
        private (set) public var _default: SwiftABI
        public var thisPtr: test_component.IInspectable { _default }
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return ISimpleDelegateImpl(abi)
        }
        public init(_ fromAbi: UnsafeMutablePointer<CABI>) {
            _default = SwiftABI(fromAbi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.ISimpleDelegateVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
        public func doThis() throws {
            try _default.DoThisImpl()
        }

        public func doThat(_ val: Int32) throws {
            try _default.DoThatImpl(val)
        }

    }

    public class InterfaceWithReturnDelegateImpl : InterfaceWithReturnDelegate, WinRTAbiBridge {
        public typealias CABI = __x_ABI_Ctest__component_CInterfaceWithReturnDelegate
        public typealias SwiftABI = __ABI_test_component.InterfaceWithReturnDelegate
        public typealias SwiftProjection = AnyInterfaceWithReturnDelegate
        private (set) public var _default: SwiftABI
        public var thisPtr: test_component.IInspectable { _default }
        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return InterfaceWithReturnDelegateImpl(abi)
        }
        public init(_ fromAbi: UnsafeMutablePointer<CABI>) {
            _default = SwiftABI(fromAbi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_test_component.InterfaceWithReturnDelegateVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
        public lazy var eventWithReturn : Event<test_component.ReturnInt32Delegate> = {
          .init(
            add: { [weak this = _default] in
              guard let this else { return .init() }
              let wrapper = __ABI_test_component_Delegates.ReturnInt32DelegateWrapper($0)
              let abi = try! wrapper?.toABI { $0 }
              return try! this.add_EventWithReturnImpl(abi)
            },
            remove: { [weak this = _default] in
             try? this?.remove_EventWithReturnImpl($0) 
           }
          )
        }()

    }

    public class ObjectHandlerImpl : WinRTDelegateBridge {
        public typealias Handler = ObjectHandler
        public typealias CABI = __x_ABI_Ctest__component_CIObjectHandler
        public typealias SwiftABI = __ABI_test_component.ObjectHandler

        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            let _default = SwiftABI(abi)
            let handler: Handler = { (item) in
                let itemWrapper = __ABI_.AnyWrapper(item)
                let _item = try! itemWrapper?.toABI { $0 }
                try! _default.InvokeImpl(_item)
            }
            return handler
        }
    }
    public class VoidToVoidDelegateImpl : WinRTDelegateBridge {
        public typealias Handler = VoidToVoidDelegate
        public typealias CABI = __x_ABI_Ctest__component_CIVoidToVoidDelegate
        public typealias SwiftABI = __ABI_test_component.VoidToVoidDelegate

        public static func from(abi: UnsafeMutablePointer<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            let _default = SwiftABI(abi)
            let handler: Handler = { () in
                try! _default.InvokeImpl()
            }
            return handler
        }
    }
}
@_spi(__MakeFromAbi_DoNotImport)
public class IBasic_MakeFromAbi : MakeFromAbi {
    public typealias CABI = __x_ABI_Ctest__component_CIBasic
    public typealias SwiftABI = __ABI_test_component.IBasic
    public typealias SwiftProjection = AnyIBasic
    public static func from(abi: UnsafeMutableRawPointer?) -> SwiftProjection? {
        guard let abi else { return nil }
        let swiftAbi: SwiftABI = try! test_component.IInspectable(abi).QueryInterface()
        return __IMPL_test_component.IBasicImpl(RawPointer(swiftAbi)!)
    }
}

@_spi(__MakeFromAbi_DoNotImport)
public class IIAmImplementable_MakeFromAbi : MakeFromAbi {
    public typealias CABI = __x_ABI_Ctest__component_CIIAmImplementable
    public typealias SwiftABI = __ABI_test_component.IIAmImplementable
    public typealias SwiftProjection = AnyIIAmImplementable
    public static func from(abi: UnsafeMutableRawPointer?) -> SwiftProjection? {
        guard let abi else { return nil }
        let swiftAbi: SwiftABI = try! test_component.IInspectable(abi).QueryInterface()
        return __IMPL_test_component.IIAmImplementableImpl(RawPointer(swiftAbi)!)
    }
}

@_spi(__MakeFromAbi_DoNotImport)
public class ISimpleDelegate_MakeFromAbi : MakeFromAbi {
    public typealias CABI = __x_ABI_Ctest__component_CISimpleDelegate
    public typealias SwiftABI = __ABI_test_component.ISimpleDelegate
    public typealias SwiftProjection = AnyISimpleDelegate
    public static func from(abi: UnsafeMutableRawPointer?) -> SwiftProjection? {
        guard let abi else { return nil }
        let swiftAbi: SwiftABI = try! test_component.IInspectable(abi).QueryInterface()
        return __IMPL_test_component.ISimpleDelegateImpl(RawPointer(swiftAbi)!)
    }
}

@_spi(__MakeFromAbi_DoNotImport)
public class InterfaceWithReturnDelegate_MakeFromAbi : MakeFromAbi {
    public typealias CABI = __x_ABI_Ctest__component_CInterfaceWithReturnDelegate
    public typealias SwiftABI = __ABI_test_component.InterfaceWithReturnDelegate
    public typealias SwiftProjection = AnyInterfaceWithReturnDelegate
    public static func from(abi: UnsafeMutableRawPointer?) -> SwiftProjection? {
        guard let abi else { return nil }
        let swiftAbi: SwiftABI = try! test_component.IInspectable(abi).QueryInterface()
        return __IMPL_test_component.InterfaceWithReturnDelegateImpl(RawPointer(swiftAbi)!)
    }
}

