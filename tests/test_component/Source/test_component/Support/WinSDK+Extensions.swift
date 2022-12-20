// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import WinSDK

public typealias REFIID = UnsafePointer<IID>

// winerror.h

@_transparent
public var E_INVALIDARG: HRESULT {
  HRESULT(bitPattern: 0x80070057)
}

@_transparent
public var E_NOTIMPL: HRESULT {
  HRESULT(bitPattern: 0x80004001)
}

@_transparent
public var E_NOINTERFACE: HRESULT {
  HRESULT(bitPattern: 0x80004002)
}

// winnt.h

@_transparent
internal func MAKELANGID(_ p: WORD, _ s: WORD) -> DWORD {
  return DWORD((s << 10) | p)
}

extension boolean {
  internal init(from val: Bool) {
    let value : boolean = val ? 1 : 0
    self.init(value)
  }
}

extension WCHAR {
  public init(from val: Character) {
    let value = try! String(val).withWideChars {
      $0[0]
    }
    self.init(value);
  }
}

extension HWND {
  public init(from val: UInt64) {
    // TODO: Revisit since this gives a compiler warning.
     self.init(unsafeBitCast(val, to: UnsafeMutablePointer<HWND__>.self))
  }
}

// stdlib.h
public var MB_MAX : Int { 
  Int(___mb_cur_max_func())
}